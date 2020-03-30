class SubscriptionsController < ApplicationController

	def index
		@subscriptions = current_chef.subscription.all
	end

	def new
		@subscription = current_chef.subscription.new      
	end

	def new_breakfast_dinner
		@subscription=current_chef.subscription.new 

    end

    def create_breakfast_dinner
		@subscription=current_chef.subscription.new(subscription_params)
			
		if(@subscription.save)
			redirect_to @subscription
		else
			render 'new_breakfast_dinner'
		end
	end

	def show_breakfast_dinner
		@subscription=current_chef.subscription.find(params[:id])
	end

    def show 
		@subscription=current_chef.subscription.find(params[:id])
	end

	def create
		@subscription=current_chef.subscription.new(subscription_params)
		
		if(@subscription.save)

			redirect_to @subscription
		else
		
			render 'new'
		end
	end
    

	
	private def subscription_params
		params.require(:subscription).permit(:is_breakfast_included,:is_lunch_included,:lunch_price,:total_price,
			:is_dinner_included,:is_veg,:is_non_veg,
			lunch:[:monday ,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday],
			breakfast:[:monday ,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday],
			dinner:[:monday ,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday])

	end


end
