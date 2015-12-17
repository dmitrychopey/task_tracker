class Task < ActiveRecord::Base
  belongs_to :status
  belongs_to :project
  belongs_to :user
  validates :title, :description, :duration, :status_id, presence: true

  scope :without_weekends, -> { where("strftime('%w', finished_at) NOT IN (?)", [1, 7]) }
  scope :average_time, -> { group("finished_at").average(:duration) }

end
