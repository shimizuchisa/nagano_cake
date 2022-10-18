class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  enum payment_method: {credit_card: 0, transfer: 1 }
  enum order_status: {pending: 0, payment_confirmation: 1, making: 2, preparing_shipment: 3, completed: 4}
end
