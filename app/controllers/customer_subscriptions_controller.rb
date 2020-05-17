class CustomerSubscriptionsController < ApplicationController
 	before_action :authenticate_user!
	def subscribe
		@customer_subscription = CustomerSubscription.new(subscription_id: params[:subs_id], customer_id: params[:customer_id])
		if(@customer_subscription.save!)
			flash[:info]="You are subscribed"
			redirect_to  customer_subscriptions_path
		end
 	end
	
 	def index
 		 @customer_subscriptions=current_customer.customer_subscription.all	
 	end


 	def show		
 		@customer_subscription=current_customer.customer_subscription.find(params[:id])
 		@subscription=Subscription.find(@customer_subscription.subscription_id)
 		@chef=Chef.find(@subscription.chef_id)
 	end

end


