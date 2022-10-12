class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :purchase_price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, default: 1
      t.timestamps
    end
  end
end
