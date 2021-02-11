class Project < ApplicationRecord
	belongs_to :user
	has_many :tasks
	validates :name,:project_type, presence: true
	enum project_type: {
    :Simple=>"Simple Project",
    :Moderate=>"Moderate Project",
    :Complex=>"Complex Project"
	}
	#@project = Project.all
    #enum project_type:[:simple,:moderate,:complex]
end
