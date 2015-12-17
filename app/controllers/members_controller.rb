class MembersController < ApplicationController
  before_action :authenticate_user!   
  before_action :set_project, only: [:add_member, :remove_member, :add_task_member, :remove_task_member]
  before_action :set_task, only: [:add_task_member, :remove_task_member]

  def add_member
    @user = User.find(params[:project][:user_ids])
    unless @project.users.include?(@user)
      @project.users<<@user
    end
    redirect_to :back
  end

  def remove_member
    @user = User.find(params[:user_id])
    @project.users.delete(@user)
    @project.tasks.each do |task|
      @user.tasks.delete(task)
    end

    redirect_to :back
  end

  def add_task_member
    @user = User.find(params[:task][:user_id])
    unless @user.tasks.include?(@task)
      @user.tasks << @task
    end
    redirect_to :back

  end

  def remove_task_member
    @user = @task.user
    @user.tasks.delete(@task)
    redirect_to :back
  end


  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
