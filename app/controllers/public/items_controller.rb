#public/items
class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @genres = Genre.all
    @items = Item.page(params[:page])
    @items = @items.where('name LIKE ?',"%#{params[:search]}%") if params[:search].present?
    # @items = @items.where('introduction LIKE ?',"%#{params[:search]}%") if params[:search].present?
    if params[:genre_id].present?
      @items = @items.where(genre_id: params[:genre_id].to_i)
      @genre = Genre.find(params[:genre_id])
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end