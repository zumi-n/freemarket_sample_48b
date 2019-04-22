class RenamePayerColumnToDelivery < ActiveRecord::Migration[5.2]
  def change
    rename_column :deliveries , :burden , :payer
  end
end
