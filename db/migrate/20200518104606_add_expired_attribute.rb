class AddExpiredAttribute < ActiveRecord::Migration[6.0]
  def change
  	add_column :customer_subscriptions, :expired, :boolean,default: false
  end
end
