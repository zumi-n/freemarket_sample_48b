class AddCategoryIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category_id
  end
end
