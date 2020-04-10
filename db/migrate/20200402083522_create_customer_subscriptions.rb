class CreateCustomerSubscriptions < ActiveRecord::Migration[5.0]
  def change
    change_table :customer_subscriptions do |t|
      t.belongs_to :customer
      t.belongs_to :subscription
    
    end
  end
end
