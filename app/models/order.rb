class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  enum payment_method: {credit_card: 0, transfer: 1 }
  enum order_status: {pending: 0, payment_confirmation: 1, making: 2, preparing_shipment: 3, completed: 4}

  def address_display
    "〒" + postal_code + ' ' + address + ' ' + name
  end

  # def item_total
    # @total = 0
    # current_customer.cart_items.each do |cart_item|
      # sub_total = cart_item.amount * cart_item.item.with_tax_price
      # @total += sub_total
    # end
    # return @total
  # end

  # def subtotal (cart_itemのmodel)
    # item.with_tax_price * amount
  # end


  # def with_tax_price (itemのmodel)
    # (price * 1.1).floor

  # def total_calc
    # sub_total = 0
    # @cart_items.each do |c|
      # sub_total = c.amount * c.item.with_tax_price
      # total += sub_total
    # end
    # return total
  # end

end