class RemoveProfitFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :profit, :string
  end
end
