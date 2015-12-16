class TasksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_task, :set_project, only: [:show, :edit, :update, :add_worker, :remove_worker, :destroy]
  
  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
   
    respond_with(@task)
  end

  def edit
  end



  def add_worker   
   @user = User.find(params[:task][:user_id])
    unless @user.tasks.include?(@task)
    @user.tasks << @task      
   end
    redirect_to :back

  end


    def remove_worker
    @user = @task.user
     @user.tasks.delete(@task)
     redirect_to :back
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.save
    @project.tasks << @task
    respond_with(@project,@task)
  end

  def update
    @task.update(task_params)
   respond_with(@project,@task)
  end

  def destroy
    @task.destroy
     redirect_to @project
  #    rescue ActionController::RedirectBackError
  # redirect_to @project
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :duration, :status_id, :finished_at, :user_ids)
    end
end
