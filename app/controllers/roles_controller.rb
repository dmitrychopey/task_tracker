class RolesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
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
  end

  def destroy

  end

  def set_role
    @role=Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end

end
