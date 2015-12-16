class AddIndexesToTasks < ActiveRecord::Migration
  def change
   	add_index :tasks, [:title, :description, :user_id, :project_id], name: 'tasks_title_desc_user_id_project_id'
  end
end
