class Project < ApplicationRecord

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	belongs_to :user
	has_many :tasks
	has_many :attachments
	validates :name,:project_type, presence: true
	enum project_type: {
    :Simple=>"Simple Project",
    :Moderate=>"Moderate Project",
    :Complex=>"Complex Project"
	}
	#@project = Project.all
    #enum project_type:[:simple,:moderate,:complex]
end
