class Subscription < ApplicationRecord
	belongs_to :chef , :class_name => 'Chef', :foreign_key => 'chef_id'
	belongs_to :customer_subscription
	serialize :lunch , Hash
	serialize :breakfast , Hash
	serialize :dinner , Hash
	


end