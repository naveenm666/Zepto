class AddColumnsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :country_of_origin, :string
    add_column :products, :shelf_life, :integer
    add_column :products, :manufacturer_name, :string
    add_column :products, :manufacturer_address, :text
  end
end
