class ChangeColumnOnOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :shipping_cost, :integer
    change_column :orders, :grand_total, :integer
  end
end
