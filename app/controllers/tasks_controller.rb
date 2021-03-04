class TasksController < ApplicationController
	
	def index
		begin
			if params[:project_id].present?
				@task=Task.all.joins(:project).where(project_id: params[:project_id])
			elsif params[:project][:id].present?
				@task=Task.all.joins(:project).where(project_id: params[:project][:id])
			else
				@task=Task.all.joins(project: :user).where(projects:{users:{id:current_user.id}})
			end
		rescue Exception => e
			@task=Task.all.joins(project: :user).where(projects:{users:{id:current_user.id}})
		end
	end

	def show
		#@task=Task.find_by(project_id: params[:project_id])
	end

	def new
		@task = Task.new
	end

	def edit
		@task=Task.find(params[:id])
	end

	def update
    
    	@task = Task.find(params[:id])

	    if @task.update(task_params)
	      redirect_to tasks_path
	    else
	      render 'tasks/edit'
	    end
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
