class SubscriptionsController < ApplicationController
	before_action :authenticate_user!
	


	def index
			p params[:search]
			if params[:search]
				@home_restarants=Chef.near(params[:search],5,units: :km)
			
			end
	end

	def all
		@subscriptions=current_chef.subscription.all

	end 

	def display_customers
		@customers=CustomerSubscription.joins(:subscription)
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

    def list
    	@menu=Subscription.find(params[:s_id])
    end

    def show
    	begin
      		@subscription=current_chef.subscription.find(params[:id])
  		rescue ActiveRecord::RecordNotFound
  				redirect_to  root_path
  		end
		
	end

	def menu

    			@chef=Chef.find(params[:chef_id])
				@searched_subscriptions=@chef.subscription.all

		
	end


	def bd
		@subs=Subscription.find(params[:subs])
		
	end 

	def bld
		@subs=Subscription.find(params[:subs])
		
	end

	def create
		@subscription=current_chef.subscription.new(subscription_params)
		
		if(@subscription.save)

			redirect_to @subscription
		else
		
			render 'new'
		end
	end


    
    def destroy 
		@subscription=current_chef.subscription.find(params[:id])
		if @subscription.destroy!
			flash[:success] = ' entry deleted Successfully'
			redirect_to all_subscriptions_path
		else
			 flash[:success] = 'Failed...'
		end

	end

	def inactive
  		@subscription= current_chef.subscription.find(params[:id])
  		@subscription.update_attribute(:active, false)
  		redirect_to all_subscriptions_path
	end

	def active
  		@subscription= current_chef.subscription.find(params[:id])
  		@subscription.update_attribute(:active, true)
  		redirect_to all_subscriptions_path
	end
	
	private def subscription_params
		params.require(:subscription).permit(:is_breakfast_included,:is_lunch_included,:lunch_price,:total_price,
			:is_dinner_included,:food_type,:active,
			lunch:[:monday ,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday],
			breakfast:[:monday ,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday],
			dinner:[:monday ,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday])

	end


end
