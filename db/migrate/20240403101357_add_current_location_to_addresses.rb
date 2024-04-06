class AddCurrentLocationToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :current_location, :string
  end
end
