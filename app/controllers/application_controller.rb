class ApplicationController < ActionController::Base
	 # before_action :authenticate_user!
   #before_action :authenticate_admin!
	 before_action :configure_permitted_parameters, if: :devise_controller?


   def after_sign_in_path_for(resource)

       user_sign_in_url = new_user_session_url
       admin_sign_in_url = new_admin_session_url
       puts "..........."
       role = resource.class
       puts "role: #{role}"

       if role.to_s == "Admin"
         puts "Admin Module"
         # return role redirect_to (root_path)
         #redirect_to("http://localhost:3000/admin")
         #redirect_to admin_session_path
         #self.response_body = nil
         #request.referer
         #super 
        "http://localhost:3000/admin/"

         # stored_location_for(resource) || admins_dashboard_path

       end

       if role.to_s == "User"
         puts "User Module"
         super
       end
    
  end
   

  protected

  def configure_permitted_parameters

        devise_parameter_sanitizer.permit(:sign_up, keys: [:org_id,:name,:gender,:dob,:role,:address,:mobile])
        devise_parameter_sanitizer.permit(:account_update, keys: [:org_id,:name,:gender,:dob,:role,:address,:mobile])
        devise_parameter_sanitizer.permit(:project, keys: [:id,:name,:project_type,:user_id])
  
  end


	# before_action :configure_permitted_parameters, if: :devise_controller?

 #protected

 #def configure_permitted_parameters
   # devise_parameter_sanitizer.for(:sign_up).push(:name, :email, :password)
  #  devise_parameter_sanitizer.for(:account_update).push(:name, :email, :password)
 #end
end
