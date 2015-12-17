class User < ActiveRecord::Base
  rolify

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}
 
  has_and_belongs_to_many :projects
  has_many :tasks

  scope :only_members, -> { joins(:roles).where.not(roles: {name: ["superadmin", "manager"]}) }

  before_validation { self.email = email.downcase if email}

end
