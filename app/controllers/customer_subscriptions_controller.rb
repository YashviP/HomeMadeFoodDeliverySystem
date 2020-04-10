class CustomerSubscriptionsController < ApplicationController
 	before_action :authenticate_user!
	def subscribe
		@customer_subscription = CustomerSubscription.new(subscription_id: params[:subs_id], customer_id: params[:customer_id])
		@customer_subscription.save!
 	end
	
 	def index
 		 @customer_subscriptions=current_customer.customer_subscription.all

 	end
 	def show
 		@customer_subscription=current_customer.customer_subscription.find(params[:id])
 		@customer_subscription=Subscription.find(@customer_subscription.subscription_id)
 	end

end
