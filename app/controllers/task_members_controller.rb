class TaskMembersController < ApplicationController

  before_action :authenticate_user!   
  before_action :set_task, only: [:create, :destroy]
  
  def create
    @member = Member.find_by(user_id: params[:user][:user_id])
    unless @member.tasks.include?(@task)
      @member.tasks << @task
    end
    redirect_to :back
  end 

  def destroy
  	@member = @task.member
    @member.tasks.delete(@task)
    redirect_to :back    
  end  
  
  private

  def set_task
    @task = Task.find(params[:id])
  end  
end
