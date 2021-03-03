class Task < ApplicationRecord
	belongs_to :project
	validates :name,:title,:task_time,:status,:task_date, presence: true
end
