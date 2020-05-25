class CustomerSubscriptionsController < ApplicationController
	
	before_action :authenticate_user! 
	before_action :check_expired_subscriptions
	
	

	def user_is_chef
		user_signed_in? and current_user.is_chef== true
	end

	def check_role
    	render file: 'public/404.html', status: 404 
  	end

	def subscribe
		@customer_subscription = CustomerSubscription.new(subscription_id: params[:subs_id], user_id: params[:user_id])
		if(@customer_subscription.save)
			flash[:info]="You are subscribed"
			redirect_to  customer_subscriptions_path
		end
 	end

 	def index
 		@customer_subscriptions=CustomerSubscription.where(:user_id => current_user.id)
 	end

 	def show	
 		begin	
 			@customer_subscription=CustomerSubscription.where(:subscription_id=>params[:id],:user_id => current_user.id)
 			@subscription=Subscription.find(@customer_subscription.subscription_id)
 			@chef=User.find(@subscription.user_id) 
 		rescue
 			render file: 'public/404.html', status: 404 
 		end
 	end

 	def check_expired_subscriptions
 		CustomerSubscription.recents
 	end

end


