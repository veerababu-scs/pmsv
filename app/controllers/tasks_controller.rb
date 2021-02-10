class TasksController < ApplicationController
	
	def index
		@project = Project.where(:user_id=>current_user.id)
		@task = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to tasks_path
		else
			render 'tasks/new'
		end
		
	end

	private

	def task_params
		params.require(:task).permit(:project_id,:name,:title,:status,:task_time,:task_date)
	end
end
