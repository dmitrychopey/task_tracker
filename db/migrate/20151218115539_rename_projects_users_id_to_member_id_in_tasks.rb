class RenameProjectsUsersIdToMemberIdInTasks < ActiveRecord::Migration
  def change
  	rename_column :tasks, :project_user_id, :member_id
  end
end
