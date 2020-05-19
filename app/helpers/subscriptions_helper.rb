module SubscriptionsHelper

	def captilize_first_letter(user_name)
		user_name.first_name.slice(0,1).capitalize + user_name.first_name.slice(1..-1)
	end

end
