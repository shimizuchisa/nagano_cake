class ChangeColumnsNotnullAddItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :is_active, false, true
    change_column_default :items, :is_active, from: nil, to: true
  end
end
