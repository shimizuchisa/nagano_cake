class AddDefaultToItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :introduction, false
    change_column_null :items, :price, false
  end
end
