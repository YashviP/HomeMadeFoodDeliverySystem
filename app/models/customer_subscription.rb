class CustomerSubscription < ApplicationRecord
	belongs_to :customer
	belongs_to :subscription

	after_commit :create_notifications, on: :create

	scope :recents, -> { where("DATE(created_at) <= ?", (Date.today).to_time - 7.days).update_all(expired: true) }
	
	private 

	def create_notifications
		Notification.create do |notification|
			notification.notify_type='subscription'
			notification.actor = self.customer
			notification.user = self.subscription.chef
			notification.target = self
			notification.second_target= self.subscription
		end
	end
end
