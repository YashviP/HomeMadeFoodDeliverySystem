class AddTotalPrice < ActiveRecord::Migration[5.0]
  def change
	add_column :subscriptions,:total_price,:float
  end
end
