namespace :subscription_ended do
	desc "Send email to users"

	task email_sender: :environment do
  		User.find_each do |user|
  			SubscriptionExpiredJob.perform_now(user.id) 
    		
  		end
	end
end
