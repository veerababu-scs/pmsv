class CreateProjectAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :project_attachments do |t|
   	 	t.attachment :avatar
   	 	t.timestamps
    end
  end
end
