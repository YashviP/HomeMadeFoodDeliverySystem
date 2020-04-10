class AddSomeMigr < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users,:House_no
  	remove_column :users,:street_name
  	remove_column :users,:district
  	add_column :users,:locality,:string
  	add_column :users,:route,:string
  	add_column :users,:administrative_area_level_1,:string 
  end
end
