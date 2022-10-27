class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    # @order.grand_total = total.to_i + @order.shipping_cost.to_i
    # total = 0
    # cart_items = current_customer.cart_items
    # cart_items.each do |cart_item|
      # price = cart_item.item.price
      # amount = cart_item.amount
      # subtotal = price * amount
      # total += subtotal
    # end
    # @order.grand_total = total + @order.shipping_cost.to_i

    @order.payment_method = params[:order][:payment_method].to_i
    #@order_items = current_customer.order_items
    if params[:order][:address_select] == "0"
      #自身の住所
      @order.name = current_customer.first_name + current_customer.last_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_select] == "1"
      # 登録済み住所
      address = current_customer.addresses.find(params[:order][:address_id])
      @order.name = address.name
      @order.postal_code = address.postal_code
      @order.address = address.address
    elsif params[:order][:address_select] == "2"
      #新規住所
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    # @order.grand_total = params[:order][:grand_total].to_i
    binding.pry
    @order.save
    redirect_to orders_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    # @order = current_customer.order.find(:id)
  end

  private

  def order_params
   params.require(:order).permit(:name, :postal_code, :address, :payment_method, :grand_total)
  end
end
