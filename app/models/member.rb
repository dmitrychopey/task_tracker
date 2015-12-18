class Member < ActiveRecord::Base
  has_many :tasks	
  belongs_to :user
  belongs_to :project
  belongs_to :role

  scope :find_by_user_id, -> (user_id) { where(user_id: user_id) }
  scope :only_users, -> { joins(:role).where.not(role: {name: ["superadmin", "manager"]}) }

end
