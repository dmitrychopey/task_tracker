class StatisticsController < ApplicationController
	  before_action :set_project, only: [:by_tasks]

	def index
    @projects = Project.all.includes(:users, :tasks)
    @today = Date.today
    @projects_h = Project.pluck(:name, :start_date).to_h
    @projects_h.each{ |key,value| @projects_h[key] = (@today -value).to_i }

    #respond_with(@projects)
  end

  def by_tasks
  	@tasks = @project.tasks
  end


private
    def set_project
      @project = Project.find(params[:id])
    end
end
