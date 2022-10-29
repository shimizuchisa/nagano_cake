class Admin::OrdersController < ApplicationController

  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_root_path
  end

  def order_params
    params.require(:order).permit(:order_status)
  end

end
