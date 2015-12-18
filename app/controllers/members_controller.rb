class MembersController < ApplicationController
  
  before_action :authenticate_user!   
  before_action :set_member, only: [:update, :destroy]

  def new
    @member = Member.new
    respond_with(@member)
  end  

  def create
    @member = Member.new(member_params)
    @member.save
    redirect_to :back
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @member.destroy
    redirect_to :back    
  end  

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:project_id, :user_id, :role_id)
  end

end
