class Task < ApplicationRecord
	belongs_to :project
	validates :name, presence: true
	validates :name, uniqueness: {scope: :project_id}
	validates :name,:title,:task_time,:status,:task_date, presence: true
end
