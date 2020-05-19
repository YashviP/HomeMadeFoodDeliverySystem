module CustomerSubscriptionsHelper

	def calculate_days_left(customer_subscription)
		days_left=0
		if customer_subscription.expired == false
			time=Time.diff(customer_subscription.created_at , DateTime.current)
			days_left=7-time[:day]			
		end

		return days_left
	end
end
