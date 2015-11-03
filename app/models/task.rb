class Task < ActiveRecord::Base
	belongs_to :status
	belongs_to :project
	belongs_to :user
end
