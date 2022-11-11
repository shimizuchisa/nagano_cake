class Admin::OrderItemsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to edit_admin_order_path(@order_item.order_id)
      flash[:notice] = "制作ステータスの更新が完了しました"
    else
      render 'order/edit'
      flash[:alert] = "制作ステータスの更新ができませんでした"
    end

  end

  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end

