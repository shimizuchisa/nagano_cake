class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      sub_total = cart_item.amount * cart_item.item.with_tax_price
      @total += sub_total
    end

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.grand_total = @order.shipping_cost + @total
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
    # binding.pry
    @order.save
    # order_itemの作成
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.order_id = @order.id
      order_item.item_id = cart_item.item_id
      order_item.purchase_price = cart_item.subtotal
      order_item.amount = cart_item.amount
      order_item.save!
    end
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_items = @order.order_items
    @order_items.each do |order_item|
      @total = 0
      sub_total = order_item.amount * order_item.item.with_tax_price
      @total += sub_total
    end
  end

  private

  def order_params
   params.require(:order).permit(:name, :postal_code, :address, :payment_method, :grand_total)
  end
end
