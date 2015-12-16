class ChangeProjectsUsersIndex < ActiveRecord::Migration
  def change
  	    remove_index :projects_users, name: :index_projects_users_on_project_id_and_user_id
  	    add_index :projects_users, [:project_id, :user_id], unique: true,  name: 'index_projects_users_on_project_id_and_user_id'
  end
end
