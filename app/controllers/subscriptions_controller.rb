class SubscriptionsController < ApplicationController
	


	before_action :authenticate_user!
	before_action :check_role, only: [:main,:new, :create,:display_customers],if: :user_is_customer


	def user_is_customer
		user_signed_in? and current_user.is_chef== false
	end

	def check_role
    	render file: 'public/404.html', status: 404 
  	end
	
	def index		
		begin params[:search]
			@home_restarants=User.near(params[:search],5,units: :km).where(:is_chef => true)
		rescue 
			flash[:error]="Please Enter Valid delivery location or area "
			redirect_to root_path	
		end
	end

	def all
		@subscriptions=current_user.subscription.all
	end 

	def display_customers		
		@customers=CustomerSubscription.joins(:subscription).where(:subscriptions => {:user_id => current_user.id})
	end

	def new
		@subscription = current_user.subscription.new   
		 
	end

	def new_breakfast_dinner
		@subscription=current_user.subscription.new 
		
    end

    def create_breakfast_dinner
		@subscription=current_user.subscription.new(subscription_params)
		
		if(@subscription.save)
			redirect_to @subscription
		else
			render 'new_breakfast_dinner'
		end
	end

    def menu
    	@menu=Subscription.find(params[:id]) or not_found
    end

    def show
  		@subscription=current_user.subscription.find(params[:id]) or not_found
  		
	end

	def list
		@chef=User.find(params[:id])
		@searched_subscriptions=@chef.subscription.all
	end

	def create
		@subscription=current_user.subscription.new(subscription_params)		
		
		if(@subscription.save)
			redirect_to @subscription
		else	
			render 'new'
		end
	end
    
    def destroy 
		@subscription=current_user.subscription.find(params[:id]) or not_found
		if @subscription.destroy!
			flash[:success] = ' entry deleted Successfully'
			redirect_to all_subscriptions_path
		else
			 flash[:success] = 'Failed...'
		end
	end

	def inactive
  		@subscription= current_user.subscription.find(params[:id]) or not_found
  		@subscription.update_attribute(:active, false)
  		redirect_to all_subscriptions_path
	end

	def active
  		@subscription= current_user.subscription.find(params[:id]) or not_found
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
