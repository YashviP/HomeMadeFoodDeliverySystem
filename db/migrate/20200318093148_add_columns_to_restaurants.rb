class AddColumnsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :longitude, :float
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :city, :string
  end
end
