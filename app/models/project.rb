class Project < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :users  
  
  validates :name, :description, :start_date, :end_date, presence: true
end
