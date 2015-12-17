class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.all.includes(:roles)
  end

  def show
  end

  def new
  end

  def create
  end  

  def edit
  end

  def update
    if @user.roles.first != nil
      @user.remove_role @user.roles.first.name
    end
    @user.add_role Role.find(params[:user][:role_ids]).name

    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :role_id)
  end
end
