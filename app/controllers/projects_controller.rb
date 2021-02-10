class ProjectsController < ApplicationController
	def index
		@project = Project.where(:user_id=>current_user.id)
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
