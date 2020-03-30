class AddCustomerId < ActiveRecord::Migration[5.0]
  def change
  	add_column :subscriptions, :customer_id, :integer
  	change_column :subscriptions, :chef_id, :integer
  end
end
