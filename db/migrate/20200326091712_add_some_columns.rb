class AddSomeColumns < ActiveRecord::Migration[5.0]
  def change

  	remove_column :subscriptions, :breakfast_item, :string
  	remove_column :subscriptions, :lunch_item, :string
  	remove_column :subscriptions, :dinner_item, :string
    
    
  end
end
