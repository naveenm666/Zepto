# db/migrate/20240205113219_add_category_id_to_products.rb
class AddCategoryIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :category, foreign_key: true
  end
end
