class AttachmentsController < ApplicationController
	
	def index
		@attachment=Attachment.all.joins(project: :user).where(projects:{users:{id:current_user.id}})
	end

	def new
		@attachment=Attachment.new
	end

	def create
		@attachment = Attachment.new(attachment_params)
		if @attachment.save
			redirect_to attachments_path
		else
			render 'attachments/new'
		end	
	end

	

	private

	def attachment_params
		params.require(:attachment).permit(:project_id,:file_name)
	end
end
