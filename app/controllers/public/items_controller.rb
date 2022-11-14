#public/items
class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  def index
    case params[:item_sort]
      when "0"
        @items = Item.all
        @genre = "商品"
      when "1"
        @items = Item.where(genre_id: 1)
        @genre = "ケーキ"
      when "2"
        @items = Item.where(genre_id: 2)
        @genre = "プリン"
      when "3"
        @items = Item.where(genre_id: 3)
        @genre = "焼き菓子"
      when "4"
        @items = Item.where(genre_id: 4)
        @genre = "キャンディ"
      when "5"
        @items = Item.search(params[:search])
        @genre = params[:search]
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  # def search
    # @items = Item.search(params[:search])
  # end
end
