module RailsAdmin
  module Config
    module Actions
      # common config for custom actions
      
      class Collection < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        
        register_instance_option :member do
          true  # this is for all records in specific model
        end

        register_instance_option :only do
          User
        end
        
        register_instance_option :link_icon do
          'fa fa-bell' # use any of font-awesome icons
        end

        register_instance_option :http_methods do
          [:get]
        end
        
        register_instance_option :controller do
          Proc.new do
            @object = User.find(params[:id])
            @pc = Project.where(:user_id=>params[:id]).count()
            @tc =Task.all.joins(project: :user).where(projects:{users:{:id=>params[:id]}}).count()
            @obj = Project.where(:user_id=>params[:id])
            # puts "........"
            # respond_to do |format|
            #   format.html { render file: "#{Rails.root}/app/views/rails_admin/main/collection.html.erb"  }
            #   # format.html do

            #   #   redirect_to 'rails_admin/main/collection.html.erb'
            #   #   #render '', status: @status_code || :ok
            #   # end
            # end
            # #render @object.index
            # #redirect_to(@object)
            # puts ".........."
            # #render :index
            # flash[:notice] = "Did custom action on "
            #redirect_to back_or_index
          end
        end

      end

    end
  end
end