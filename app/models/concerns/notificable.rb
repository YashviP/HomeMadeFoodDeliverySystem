module Notificable
  extend ActiveSupport::Concern # module '::'

  included do # this appends in each place where we call this module
    has_many :notifications, as: :item
    after_commit :send_notifications_to_users
  end

  def send_notifications_to_users
    if self.respond_to? :user_ids # returns true if the model you are working with has a user_ids method
      NotificationSenderJob.perform_later(self)
    end
  end
end