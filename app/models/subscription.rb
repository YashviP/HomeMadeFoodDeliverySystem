class Subscription < ApplicationRecord
	
	include Notificable

	belongs_to :chef , :class_name => 'Chef', :foreign_key => 'chef_id'
	belongs_to :customer_subscription
	belongs_to :user
	serialize :lunch , Hash
	serialize :breakfast , Hash
	serialize :dinner , Hash

	def user_ids
		User.all.ids
	end

end