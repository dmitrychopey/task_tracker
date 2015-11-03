class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def remove_task
    
  end

  def edit
  end

  def update
  end

    def destroy

  end

   private
    def set_user
      @user = User.find(params[:id])
    end
   
    def task_params
      params.require(:user).permit(:email, :password, :task_id)
    end
end
