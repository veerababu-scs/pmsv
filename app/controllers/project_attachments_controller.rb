class ProjectAttachmentsController < ApplicationController
	
	def index
		begin
			if params[:project][:id].present?
				@project_attachment=ProjectAttachment.all.joins(:project).where(project_id: params[:project][:id])
			else
				@project_attachment=ProjectAttachment.all.joins(project: :user).where(projects:{users:{id:current_user.id}})
			end
		rescue Exception => e
			@project_attachment=ProjectAttachment.all.joins(project: :user).where(projects:{users:{id:current_user.id}})
		end
		#@project_attachment=ProjectAttachment.all.joins(project: :user).where(projects:{users:{id:current_user.id}})
	end

	def new
 		@project_attachment = ProjectAttachment.new
	end

	def show
		@project_attachment=ProjectAttachment.find(params[:id])
	end

	def create
 		#@project_attachment = ProjectAttachment.create(project_params)
 		@project_attachment = ProjectAttachment.new(projectfile_params)
		if @project_attachment.save
			redirect_to project_attachments_path
		else
			render 'new'
		end
	end

	private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

	def projectfile_params
		params.require(:project_attachment).permit(:avatar,:project_id)
	end
end
