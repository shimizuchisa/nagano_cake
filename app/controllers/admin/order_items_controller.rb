class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(making_status: params[:making_status])
    redirect_to root_path
  end
end
