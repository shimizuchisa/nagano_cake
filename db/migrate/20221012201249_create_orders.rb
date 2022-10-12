class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :shipping_cost, null: false
      t.string :grand_total, null: false
      t.string :payment_method, null: false
      t.string :order_status, null: false, default: 1
      t.timestamps
    end
  end
end
