class UsersMailer < ApplicationMailer
	def subscription_ended_notify_email(user_id)
    	@user = User.find(user_id)

     	mail(to: @user.email, subject: 'Subscription Ended')
  end
end
