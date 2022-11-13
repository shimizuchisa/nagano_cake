class Admin::OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to edit_admin_order_path(@order)
      @order = Order.find(params[:id])
      # binding.pry
      if @order.order_status == "payment_confirmation" #なぜstring？？数字はkeyだから？
        @order.order_items.each do |order_item|
          order_item.update(making_status: 1) #こっちはなぜ数字？
        end
      end
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
