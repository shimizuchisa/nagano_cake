class Admin::OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_amount = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to edit_admin_order_path(@order)

  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end

end
