class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user_id: current_user.id).news
    @notifications.update_all(viewed: true)
  end

  private
  def notification_params
    params.require(:notification).permit(:viewed)
  end
end