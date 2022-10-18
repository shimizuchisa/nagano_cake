class AddReferenceToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :genre, foreign_key: true
    # change_column_null :items, :genre_id, false
  end
end
