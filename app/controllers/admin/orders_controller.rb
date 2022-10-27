class Admin::OrdersController < ApplicationController

  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status: params[:order_status])
    redirect_to root_path
  end

end
