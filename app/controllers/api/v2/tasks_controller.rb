class Api::V2::TasksController < Api::V2::ApiController
	before_action :check_api_key
	before_action :set_task, only: [:show, :update, :destroy]
	def index 
		@tasks= @user.tasks
end

def create
	@task = Task.new(task_params)
	@task.user_id = @user.id
	if @task.save
		render 'create.json' 
	else
		render 'errors.json'
	end

end

def show 
		@task = Task.find(params[:id])
end

def destroy
		@task = Task.find(params[:id])
		@task.destroy

end

def update
	@task.user_id = @user.id
@task = Task.find(params[:id])
if @task.update_attributes(task_params)
	render 'update.json'
else
	render 'errors.json'
end

end

	def task_params
		params[:task].permit(:title, :due_date, :is_completed)
	end
	private
	def set_task
		@task = @user.tasks.find(params[:id])
	end
end