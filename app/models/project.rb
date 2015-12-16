class Project < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :tasks
	validates :name, :description, :start_date, :end_date, presence: true	
end
