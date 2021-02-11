class Task < ApplicationRecord
	belongs_to :project
	validates :name,:title,:task_date,:task_time,:status, presence: true
end
