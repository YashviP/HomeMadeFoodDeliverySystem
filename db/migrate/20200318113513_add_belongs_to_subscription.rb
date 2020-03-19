class AddBelongsToSubscription < ActiveRecord::Migration[5.0]
  	def change
    	change_table :subscriptions do |t|
    		t.belongs_to :users
    	end
    end
end
