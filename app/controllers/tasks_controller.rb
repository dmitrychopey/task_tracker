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

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)

    @task.transaction do
    @task.save!
    @project.tasks << @task
    end

    respond_with(@project, @task)
  end

  def update
    @task.update(task_params)
    respond_with(@project, @task)
  end

  def destroy
    @task.destroy
    redirect_to @project
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
