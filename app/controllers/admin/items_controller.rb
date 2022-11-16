#admin/items
class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.is_active = true
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render 'new'
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def cakes
    @cakes = Item.where(genre_id: 1)
  end

  def puddings
    @puddings = Item.where(genre_id: 2)
  end

  def baked_sweets
    @baked_sweets = Item.where(genre_id: 3)
  end

  def candies
    @candies = Item.where(genre_id: 4)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      @item = Item.find(params[:id])
      render 'edit'
      flash[:notice] = "更新が完了しました"
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image)
  end
end
