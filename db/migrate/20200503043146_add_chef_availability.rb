class AddChefAvailability < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :availability, :boolean
  	add_column :subscriptions,:active,:boolean
  end
end
