class Task < ActiveRecord::Base
	belongs_to :status
	belongs_to :project
	belongs_to :user
	validates :title, :description, :duration, :status_id, presence: true

    scope :only_workers, -> { select(:id, :title, :duration, :finished_at).where.not(user_id: User.find_by_sql("select users.id from users join users_roles on users.id = users_roles.user_id where users_roles.role_id IN (select roles.id from roles where name = 'superadmin' or name = 'manager')"))}
    scope :without_weekends, -> { where("strftime('%w', finished_at) NOT IN (?)", [1,7]) }
    scope :average_time, -> {group("finished_at").average(:duration)}
    
end
