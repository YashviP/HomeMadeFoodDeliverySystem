class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  devise_group :user, contains: [:customer, :chef]
  before_action :configure_permitted_parameters, if: :devise_controller? 

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  

  Rails.application.config.paths["app/views"] << 'login_links'

  private
  
  def not_found
    render file: 'public/404.html', status: 404
  end
 
  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:users_id ,:profile_image,:first_name,:middle_name,:last_name,:mobile_number,:address,:country,:city,:state,:pincode,:email,:password,:password_confirmation,:longitude,:latitude,:House_no,:street_no,:street_name,:district,:availability])
		devise_parameter_sanitizer.permit(:account_update, keys:[:profile_image,:first_name,:middle_name,:last_name,:mobile_number,:address,:country,:city,:state,:pincode,:email,:password,:password_confirmation,:availability])
  end

end
