class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
  end
end
