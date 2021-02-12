class ProjectsController < ApplicationController
	

	def index

		if !params[:project_type].present?
			@project = Project.where(:user_id=>current_user.id)
		else
			@project=Project.where(project_type: params[:project_type],:user_id=>current_user.id)
		end
		
	end

	

	def edit
		@project = Project.find(params[:id])
		#@project1 = Project.where(:project_type=>"Moderate",:user_id=>current_user.id)
	end

	def update
    
    	@project = Project.find(params[:id])

	    if @project.update(project_params)
	      redirect_to projects_path
	    else
	      render 'projects/edit'
	    end
  	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else
			render 'projects/new'
		end
		
	end

	private

	def project_params
		params.require(:project).permit(:name, :project_type,:user_id)
	end
end
