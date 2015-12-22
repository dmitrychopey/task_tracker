class Task < ActiveRecord::Base
  belongs_to :status
  belongs_to :project 
  belongs_to :member
  
  validates :title, :description, :duration, :status_id, :started_at, :finished_at, presence: true
  
  validate :started_at_finished_at

  def started_at_finished_at
       errors.add(:started_at, " : Start date should be less then end date") if started_at > finished_at
  end

  scope :maxFinishDate, -> { maximum(:finished_at) }
  scope :minStartedDate, -> { minimum(:started_at) }
  scope :total_time, -> { (maxFinishDate - minStartedDate).to_i/3600 }
  scope :total_range, -> { (maxFinishDate.to_date)..(minStartedDate.to_date) }  
  scope :total_without_weekends, -> { self.total_time - weekdays_in_date_range(self.total_range) }


  protected
  def self.weekdays_in_date_range(range) 
    range.select { |d| (1..5).include?(d.wday) }.size
  end

end

  # scope :total_time, -> {maxFinishDate}