#admin/items
class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to "/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to "/items"
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price)
  end
end
