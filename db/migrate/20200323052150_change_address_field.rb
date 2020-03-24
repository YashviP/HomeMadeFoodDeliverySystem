class ChangeAddressField < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :house_no, :number
  	add_column :users, :street, :string
  	add_column :users, :locality, :string
  	remove_column :users, :address, :string

  end
end
