class NotificationsController < ApplicationController

	before_action :authenticate_user!
  	before_action :check, only: [:index,:create,:new],if: :user_is_customer

	def user_is_customer
		user_signed_in? and current_user.is_chef== false
	end

	def check
    	render file: 'public/404.html', status: 404 
  	end
  	def index
    	@notifications = Notification.where(user_id: current_user.id , is_chef: false).news
    	@notifications.update_all(viewed: true)
  	end

  	private
  	def notification_params
    	params.require(:notification).permit(:viewed)
  	end
end