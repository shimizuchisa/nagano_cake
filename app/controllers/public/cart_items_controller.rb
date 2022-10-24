class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def create
    #  1. 追加した商品がカート内に存在するかの判別
    # 存在した場合
      #  カート内の個数をフォームから送られた個数分追加する
    # 存在しなかった場合:カートモデルにレコードを新規作成する

    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount = cart_item.amount + params[:cart_item][:amount].to_i
      cart_item.save
      #if文2,3列目は下記でもOK
      # new_amount = cart_item.amount + @cart_item.amount
      # cart_item.update(amount: new_amount)
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.customer_id = current_customer.id
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path

  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
