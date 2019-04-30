class ChangeAncestryToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :categories, :ancestry, :string, null: true, index: true
  end
  def down
    change_column :categories, :ancestry, :string, null: false, index: true
  end
end

