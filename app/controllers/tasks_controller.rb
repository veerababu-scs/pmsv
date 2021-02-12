class TasksController < ApplicationController
	
	def index

		if !params[:project_id].present?
			@task=Task.all.joins(project: :user).where(projects:{users:{id:current_user.id}})
		else
			@task=Task.all.joins(:project).where(project_id: params[:project_id])
		end
	end

	def show
		#@task=Task.find_by(project_id: params[:project_id])
	end

	def new
		@task = Task.new
	end

	def edit
		#@task=Task.find(params[:id])
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
