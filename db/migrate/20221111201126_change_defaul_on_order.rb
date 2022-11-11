class ChangeDefaulOnOrder < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :order_status, from: 1, to: 0
  end
end
