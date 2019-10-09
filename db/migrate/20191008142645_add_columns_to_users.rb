class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address_country, :string
    add_column :users, :address_city, :string
    add_column :users, :gender, :string
  end
end
