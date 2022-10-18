class RemoveColumnFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :genre_id, :integer
  end
end
