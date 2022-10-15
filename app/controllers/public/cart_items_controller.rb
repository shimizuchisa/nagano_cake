class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = Cart_item.find(params[:id])
    @cart_item.update(cart_item_params)

  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
  end

  def destroy_all
    @cart_items = Cart_item.all
    @cart_items.destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
