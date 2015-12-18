class Role < ActiveRecord::Base
  has_many :members
  belongs_to :resource, :polymorphic => true
  has_and_belongs_to_many :users, :join_table => :users_roles  

  validates :resource_type,
            :inclusion => {:in => Rolify.resource_types},
            :allow_nil => true
  validates :name, presence: true

  scopify
end
