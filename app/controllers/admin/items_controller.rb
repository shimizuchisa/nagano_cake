#admin/items
class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.is_active = true
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    # comment = current_user.post_comments.new(post_comment_params)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price)
  end
end
