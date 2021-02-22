class Devise::CheckgaController < Devise::SessionsController
  prepend_before_action :devise_resource, :only => [:show]
  prepend_before_action :require_no_authentication, :only => [ :show, :update ]

  include Devise::Controllers::Helpers

  def show
    us = User.find_by(:gauth_tmp=>params[:id])
    @bpin = us.ga_pin
    #puts @bpin
    @tmpid = params[:id]
    #puts @tmpid
          if @tmpid.nil?
            redirect_to :root
          else
            render :show
          end

  end

  def update
    puts ".......1"
    resource = resource_class.find_by_gauth_tmp(params[resource_name]['tmpid'])
    puts resource
    if not resource.nil?
      puts ".......2"
      puts params[resource_name]['gauth_token']
      puts params[resource_name]['ga_pin']
      if resource.validate_token(params[resource_name]['gauth_token'].to_i) || params[resource_name]['ga_pin'] == params[resource_name]['gauth_token']
            puts ".........3"
            set_flash_message(:notice, :signed_in) if is_navigational_format?
            puts ".......4"
            sign_in(resource_name,resource)
            warden.manager._run_callbacks(:after_set_user, resource, warden, {:event => :authentication})
            respond_with resource, :location => after_sign_in_path_for(resource)

            if not resource.class.ga_remembertime.nil? 
              puts ".....5"
              cookies.signed[:gauth] = {
                :value => resource.email << "," << Time.now.to_i.to_s,
                :secure => !(Rails.env.test? || Rails.env.development?),
                :expires => (resource.class.ga_remembertime + 1.days).from_now
              }
              puts ".....6"
            end
      else
        puts ".......7"
        flash[:alert]="Invalid_Token"#set_flash_message(:alert, :invalid_token)
        redirect_to :root
      end

    else
      puts "........8"
      flash[:alert]="Invalid_Token"#set_flash_message(:alert, :invalid_token)
      redirect_to :root
    end
  end

  private

  def devise_resource
    self.resource = resource_class.new
  end
end