class AddAttachmentAvatarToProjectAttachments < ActiveRecord::Migration[6.1]
  def self.up
    change_table :project_attachments do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :project_attachments, :avatar
  end
end
