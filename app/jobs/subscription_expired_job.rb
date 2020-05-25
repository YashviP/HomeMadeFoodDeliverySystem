def perform(user_id)   
      UsersMailer.welcome_email(user_id).deliver
end
