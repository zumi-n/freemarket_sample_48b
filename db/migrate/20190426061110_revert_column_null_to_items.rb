class RevertColumnNullToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :user_id, false
  end
end
