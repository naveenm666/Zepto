class AddProductWeightToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :product_weight, :string
  end
end
