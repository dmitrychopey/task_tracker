class User < ActiveRecord::Base
  rolify

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}
 
  has_many :members
  has_many :projects, through: :members  
  
  scope :not_members, -> (project_id) { where.not(id: Member.select(:user_id).where(project_id: project_id)) }
  private

  before_validation { self.email = email.downcase if email}

end
