class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :item, foreign_key: true, null: false
      t.string :burden, null: false
      t.string :method, null: false
      t.string :area, null: false
      t.string :date

      t.timestamps
    end
  end
end
