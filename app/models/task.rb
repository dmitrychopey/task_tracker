class Task < ActiveRecord::Base
	belongs_to :status
	belongs_to :project
	belongs_to :user
	validates :title, :description, :duration, :status_id, presence: true

end
