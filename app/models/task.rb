class Task < ActiveRecord::Base
  belongs_to :status
  belongs_to :project 
  belongs_to :member
  
  validates :title, :description, :duration, :status_id, :started_at, :finished_at, presence: true
  validate :started_at_finished_at

  def started_at_finished_at
      errors.add(:start_date, " : Start date should be less then end date") if started_at > finished_at
  end

  scope :without_weekends, -> { where("strftime('%w', finished_at) NOT IN (?)", [1, 7]) }
  scope :average_time, -> { group("finished_at").average(:duration) }

end
