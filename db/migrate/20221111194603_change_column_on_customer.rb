class ChangeColumnOnCustomer < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :postal_code, false
    change_column_null :customers, :address, false
    change_column_null :customers, :telephone_number, false

  end
end
# change_column_null(テーブル名, カラム名, NULL, デフォルト値=nil)
# 例
# 追加 change_column_null(:users, :nickname, false)
# 削除 change_column_null(:users, :nickname, true)
# 既存のNULLを空文字に置き換えてNULL制約を追加 change_column_null(:users, :nickname, false, "")
