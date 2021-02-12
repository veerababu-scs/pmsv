class Attachment < ApplicationRecord
	belongs_to :project
	# validates :file_name, presence: true
end
