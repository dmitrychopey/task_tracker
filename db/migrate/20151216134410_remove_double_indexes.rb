class RemoveDoubleIndexes < ActiveRecord::Migration
  def change
    remove_index :projects_users, name: :index_projects_users_on_user_id_and_project_id 
    remove_index :roles, name: :index_roles_on_name
    
  end
end
