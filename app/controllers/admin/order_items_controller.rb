class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items
    if @order_item.update(order_item_params)
      #making_statusが１つでも制作中になった場合
      if @order_items.exists?(making_status: 2) #制作中ステータスが存在するか確認
        @order.update(order_status: "making")
      #making_statusがすべて制作完了になった場合(レコードの数と制作完了ステータス数を比較)
      elsif @order_items.count == @order_items.where(making_status: 3).count
        @order.update(order_status: 3)
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