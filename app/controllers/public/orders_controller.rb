class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:@order][:payment_method].to_i
    if select == 0 then
      #自身の住所
      @order.name = current_customer.first_name + current_customer.last_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif select == 1 then
      # 登録済み住所
      @address = current_customer.address.find(:id)
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
    else
      #新規住所
    end
    @order.save
    redirect_to orders_complete_path
  end

  def create
    @order.save
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.order.find(:id)
  end

  private

  def order_params
   params.require(:order).permit(:name, :postal_code, :address, :payment_method)
  end
end
