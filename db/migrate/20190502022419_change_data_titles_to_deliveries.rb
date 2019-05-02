class ChangeDataTitlesToDeliveries < ActiveRecord::Migration[5.2]
  def change
    change_column :deliveries, :payer, :string, null: false
    change_column :deliveries, :method, :string, null: false
    change_column :deliveries, :area, :string, null: false
  end
end
