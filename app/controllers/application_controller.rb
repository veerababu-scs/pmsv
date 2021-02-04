class ApplicationController < ActionController::Base
	 before_action :authenticate_user!
	 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:gender,:dob,:role,:address,:mobile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:gender,:dob,:role,:address,:mobile])
  end
	# before_action :configure_permitted_parameters, if: :devise_controller?

 #protected

 #def configure_permitted_parameters
   # devise_parameter_sanitizer.for(:sign_up).push(:name, :email, :password)
  #  devise_parameter_sanitizer.for(:account_update).push(:name, :email, :password)
 #end
end
