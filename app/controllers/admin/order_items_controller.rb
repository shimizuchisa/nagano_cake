class Admin::OrderItemsController < ApplicationController

  def update
    # @order = Order.find(params[:id])

    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items
    if @order_item.update(order_item_params)
    
      if @order_items.exists?(making_status: 2) #  #User.exists?(name: '田中')
        @order.update(order_status: "making")
      end
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