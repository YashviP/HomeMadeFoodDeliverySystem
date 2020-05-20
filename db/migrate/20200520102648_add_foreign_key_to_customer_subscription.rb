class AddForeignKeyToCustomerSubscription < ActiveRecord::Migration[6.0]
   def change
    change_table :customer_subscriptions do |t|
      t.belongs_to :user
    end
  end
end
