class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :item, foreign_key: true, null: false
      t.string :ancestry, null: false, index: true

      t.timestamps
    end
  end
end
