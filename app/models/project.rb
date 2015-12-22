class Project < ActiveRecord::Base
  has_many :tasks
  has_many :members
  has_many :users, through: :members  
  
  validates :name, :description, :start_date, :end_date, presence: true
  validate :start_date_end_date

  def start_date_end_date
      errors.add(:start_date, " : Start date should be less then end date") if start_date > end_date
  end

  def total_days
  	end_date-start_date
  end


end
