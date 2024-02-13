class AddProductWeightToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :product_weight, :string
  
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE products
          ADD CONSTRAINT check_product_weight
          CHECK (product_weight IN ('kg', 'grams', 'liters', 'ml'))
        SQL
      end
    end
  end
end
