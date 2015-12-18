class AddProjectUserIdToTasks < ActiveRecord::Migration
  def change
  	remove_column :tasks, :user_id
    add_column :tasks, :project_user_id, :integer
  end
end
