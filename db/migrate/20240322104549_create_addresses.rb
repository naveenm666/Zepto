class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.integer :house_no
      t.string :block_no
      t.string :landmark
      t.integer :address_type
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
