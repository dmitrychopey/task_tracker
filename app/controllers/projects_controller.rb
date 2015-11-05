class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_project, only: [:show, :edit, :update, :add_worker,:remove_worker, :destroy]

  respond_to :html

  def index
    @projects = Project.all
   
    #respond_with(@projects)
  end

  def show
    @all_users = User.all
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def add_worker   
   @user = User.find(params[:project][:user_ids])
    unless @project.users.include?(@user)
    @project.users<<@user       
   end
    redirect_to :back

  end

  def remove_worker
    @user = User.find(params[:user_id])
     @project.users.delete(@user)
     @project.tasks.each do |task|
      @user.tasks.delete(task)
    end

     redirect_to :back
  end

  #  def remove_task
  #   @task = Task.find(params[:user_id])
  #    @project.users.delete(@user)
  #    redirect_to :back
  # end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    
    respond_with(@project)
  end

  

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :start_date, :end_date, :user_ids)
    end
end
