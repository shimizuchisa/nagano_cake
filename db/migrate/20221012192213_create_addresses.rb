class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      #外部キー制約 t.references :user, foreign_key: true
      # ->user_idが追加
      t.references :customer, foreign_key: true
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
