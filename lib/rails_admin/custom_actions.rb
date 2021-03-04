module RailsAdmin
  module Config
    module Actions
      # common config for custom actions
      
      class Collection < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :collection do
          true  # this is for all records in specific model
        end
        
        register_instance_option :link_icon do
          'fa fa-paper-plane' # use any of font-awesome icons
        end
        register_instance_option :http_methods do
          [:get, :post]
        end
        register_instance_option :controller do
          Proc.new do
            @object = Project.first(2)
            flash[:notice] = "Did custom action on #{@object.id}"
            redirect_to back_or_index
          end
        end
      end
      
    end
  end
end