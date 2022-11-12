class Admin::OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    # @order.order_status = params[:order_status].to_i
    # binding.pry
    if @order.update(order_params)
      # if @order.order_status == 1
        # @order.order_items.each do |order_item|
          # order_item.making_status = 1
          # order_item.update
        # end
      # end
      redirect_to edit_admin_order_path(@order)
      flash[:notice] = "注文ステータスの更新が完了しました"
    else
      render 'edit'
      flash[:alert] = "注文ステータスの更新ができませんでした"
    end
  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end
end
