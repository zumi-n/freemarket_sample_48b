class ChangeDataTitleToDeliveries < ActiveRecord::Migration[5.2]
  def change
    change_column :deliveries, :payer, :integer, null: false
    change_column :deliveries, :method, :integer, null: false
    change_column :deliveries, :area, :integer, null: false
  end
end
