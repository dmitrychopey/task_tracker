class TasksController < ApplicationController
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
    @project.tasks << @task
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
    @task = Task.new(task_params)
    @task.save
    redirect_to project_path(@task.project)
  end

  def update
    @task.update(task_params)
   redirect_to project_path(@task.project)
  end

  def destroy
    @task.destroy
     redirect_to :back
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :duration, :status_id, :user_ids)
    end
end
