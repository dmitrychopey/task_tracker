class RenameProjectUsersToMembers < ActiveRecord::Migration
  def change
  	rename_table :project_users, :members
  end
end
