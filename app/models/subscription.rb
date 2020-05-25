class Subscription < ApplicationRecord
	belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :customer_subscription
	belongs_to :user
	serialize :lunch , Hash
	serialize :breakfast , Hash
	serialize :dinner , Hash
	
end