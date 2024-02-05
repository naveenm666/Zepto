class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.integer :weight
      t.float :price
      t.string :
      
      

      t.timestamps
    end
  end
end
