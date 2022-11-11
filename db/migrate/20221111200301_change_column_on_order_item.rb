class ChangeColumnOnOrderItem < ActiveRecord::Migration[6.1]
  def change
    change_column_default :order_items, :making_status, from: 1, to: 0
  end
end
