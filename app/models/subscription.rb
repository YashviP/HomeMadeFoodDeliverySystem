class Subscription < ApplicationRecord
	belongs_to :chef , :class_name => 'Chef', :foreign_key => 'chef_id'
	
	serialize :lunch , Hash
	serialize :breakfast , Hash
	serialize :dinner , Hash
	
end
