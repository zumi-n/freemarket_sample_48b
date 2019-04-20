class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, index: true , null: false
      t.text :description
      t.string :brand
      t.string :size
      t.string :condition, null: false
      t.string :price, null: false
      t.string :profit, null: false

      t.timestamps
    end
  end
end
