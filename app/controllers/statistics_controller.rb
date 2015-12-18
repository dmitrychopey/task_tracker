class StatisticsController < ApplicationController
  before_action :set_project, only: [:by_tasks]

  def index
    @projects = Project.all.includes(:users, :tasks)

    @today = Date.today

    @projects_chart = Project.pluck(:name, :start_date).to_h
    @projects_chart.each { |key, value|
      @projects_chart[key] = (@today -value).to_i 
    }  

    @members_tasks=(Task.without_weekends.joins(:member).merge Member.only_users).average_time
    
  end

  def by_tasks
    @tasks = @project.tasks
    @members_tasks=(@tasks.without_weekends.joins(:member).merge Member.only_users).average_time
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

end
