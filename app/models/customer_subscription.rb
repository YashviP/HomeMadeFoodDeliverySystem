class CustomerSubscription < ApplicationRecord
	
	belongs_to :user,:class_name => 'User', :foreign_key => 'user_id'
	belongs_to :subscription

	after_commit :create_notifications, on: :create

	

	scope :recents, -> { where("DATE(created_at) <= ?", (Date.today).to_time - 7.days).update_all(expired: true) }
	
	private 

	def create_notifications
		Notification.create do |notification|
			notification.notify_type='subscription'
			notification.actor = self.user
			notification.user = self.subscription.user
			notification.target = self
			notification.second_target= self.subscription
		end
	end
end
