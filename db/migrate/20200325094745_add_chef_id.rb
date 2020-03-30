class AddChefId < ActiveRecord::Migration[5.0]
  def change
  	add_column :subscriptions, :chef_id, :string
  end
end
