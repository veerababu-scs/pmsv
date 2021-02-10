class Project < ApplicationRecord
	belongs_to :user
	has_many :tasks
	validates :name, presence: true
	enum project_type: {
    simple: "Simple Project",
    moderate: "Moderate Project",
    complex: "Complex Project"
	}
	#@project = Project.all
    #enum project_type:[:simple,:moderate,:complex]
end
