class ChangeProductWeightColumnType < ActiveRecord::Migration[7.1]
  def up
    change_column(:products, :product_weight, :integer, limit: 1)
  end

  def down
    change_column(:products, :product_weight, :string)
  end
end
