class RemoveSomeAddressFields < ActiveRecord::Migration[5.0]
  def change

  	remove_column :users, :house_no, :number
  	remove_column :users, :street, :string
  	remove_column :users, :locality, :string
  	add_column :users, :address, :string
    remove_column :users, :longitude,:float
    remove_column :users, :latitude,:float

  end
end
