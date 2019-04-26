class ChangeColumnNullToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :user_id, true
  end
end
