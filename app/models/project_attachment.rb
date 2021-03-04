class ProjectAttachment < ApplicationRecord
	validates :project_id, presence: { message: "Must be Select" }
	validates :avatar, presence: { message: "Please Choose File" }
	belongs_to :project
	
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/, message: "Upload Image Files Only"
end
