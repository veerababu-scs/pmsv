class AddProjectsToAttachments < ActiveRecord::Migration[6.1]
  def change
  	add_reference :project_attachments, :project
  	add_foreign_key :project_attachments, :projects
  end
end
