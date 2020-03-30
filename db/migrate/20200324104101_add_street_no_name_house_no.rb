class AddStreetNoNameHouseNo < ActiveRecord::Migration[5.0]
def change
  	add_column :users, :House_no,:decimal
  	add_column :users, :street_no,:decimal
    add_column :users, :street_name,:string
    add_column :users, :district,:string
  end
end
