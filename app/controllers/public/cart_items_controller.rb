class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    # @item = Item.find(params[:id])
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)

  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
