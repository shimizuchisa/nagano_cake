class ChangeCloumnsNotnullAddItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :is_active, true

  end
end
