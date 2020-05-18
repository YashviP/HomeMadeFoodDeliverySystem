class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  
  protect_from_forgery with: :exception
	devise_group :user, contains: [:customer, :chef]
	before_action :configure_permitted_parameters, if: :devise_controller?
	
  #unless Rails.application.config.consider_all_requests_local
  #  rescue_from ActionController::RoutingError, with: -> { render_404  }
  #  rescue_from ActiveRecord::RecordNotFound, with: -> { render_404  }
  #end
  Rails.application.config.paths["app/views"] << 'login_links'
  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
 
  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:users_id ,:profile_image,:first_name,:middle_name,:last_name,:mobile_number,:address,:country,:city,:state,:pincode,:email,:password,:password_confirmation,:longitude,:latitude,:House_no,:street_no,:street_name,:district,:availability])
		devise_parameter_sanitizer.permit(:account_update, keys:[:profile_image,:first_name,:middle_name,:last_name,:mobile_number,:address,:country,:city,:state,:pincode,:email,:password,:password_confirmation,:availability])
  end

end
