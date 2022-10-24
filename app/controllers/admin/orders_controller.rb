class Admin::OrdersController < ApplicationController

  def edit
    @orders = Order.all
    @order_items = OrderItems.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status: params[:order_status])
    redirect_to admin_path
  end

end
