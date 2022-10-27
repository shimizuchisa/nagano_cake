#public/items
class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  def index
    @cakes = Item.where(genre_id: 1)
    @puddings = Item.where(genre_id: 2)
    @baked_sweets = Item.where(genre_id: 3)
    @candies = Item.where(genre_id: 4)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
