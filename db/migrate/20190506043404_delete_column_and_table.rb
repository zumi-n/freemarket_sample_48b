class DeleteColumnAndTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :family_name_kanji, :string
    remove_column :addresses, :family_name_kana, :string
    remove_column :addresses, :first_name_kanji, :string
    remove_column :addresses, :first_name_kana, :string
    remove_column :addresses, :birthday, :date

    add_column :users, :phone_number, :string, null: false, unique: true

  end
end
