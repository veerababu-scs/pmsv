class Devise::DisplayqrController < DeviseController
  prepend_before_action :authenticate_scope!, :only => [:show, :update, :refresh]

  include Devise::Controllers::Helpers

  # GET /resource/displayqr
  def show

    if resource.nil? || resource.gauth_secret.nil?
      
      sign_in resource_class.new, resource
      redirect_to stored_location_for(scope) || :root
    else
      @tmpid = resource.assign_tmp
      #if resource.gauth_enabled?
       # @u = User.find(resource.id)
       # @bpin = @u.ga_pin
      #end
      #if resource.gauth_enabled?

      #end
      #@up = User.find(resource.id)
      #us = User.find_by(:gauth_tmp=>params[:id])
      #@bpin = us.ga_pin
      #puts @bpin
      render :show
    end
  end

  def update

puts params[resource_name]['ga_pin']
puts "...........1"
puts params[resource_name]['gauth_token']
puts "......2"
    #puts params[resource_name]['gauth_token'].to_i
    if resource.gauth_tmp != params[resource_name]['tmpid'] || !resource.validate_token(params[resource_name]['gauth_token'].to_i)
      puts ".......3"
      flash[:alert]="Invalid_Token"
      redirect_to :user_displayqr
      return
    end
    puts ".......4"
    if resource.set_gauth_enabled(params[resource_name]['gauth_enabled'])
      set_flash_message :notice, (resource.gauth_enabled? ? :enabled : :disabled)
      
                if resource.gauth_enabled?
                  @bpin = 6.times.map{rand(10)}.join
                  @up = User.find(resource.id)
                  @up.update(ga_pin:@bpin.to_i)
                  flash[:notice]="Your Back-Up Pin is: #{@bpin}"#set_flash_message(:notice, "Your Back-Up Pin is: #{@bpin}")#puts @up.name,@bpin
                else
                  @bpin = nil
                  @up = User.find(resource.id)
                  @up.update(ga_pin:@bpin.to_i)
                  flash[:notice]="Disabled 2FA"#set_flash_message(:notice, "Your Back-Up Pin is: null")
                end

      bypass_sign_in resource, scope: scope
      redirect_to stored_location_for(scope) || :root
    else
      render :show
    end

  end

  def refresh
    unless resource.nil?
      resource.send(:assign_auth_secret)
      resource.save
      set_flash_message :notice, :newtoken
      #bypass_sign_in(@user)
      bypass_sign_in resource, scope: scope
      #sign_in scope, resource, :bypass => true
      redirect_to [resource_name, :displayqr]
    else
      redirect_to :root
    end
  end

  private
  def scope
    resource_name.to_sym
  end

  def authenticate_scope!
    send(:"authenticate_#{resource_name}!")
    self.resource = send("current_#{resource_name}")
  end

  # 7/2/15 - Unsure if this is used anymore - @xntrik
  def resource_params
    return params.require(resource_name.to_sym).permit(:gauth_enabled,:ga_pin) if strong_parameters_enabled?
    params
  end

  def strong_parameters_enabled?
    defined?(ActionController::StrongParameters)
  end
end