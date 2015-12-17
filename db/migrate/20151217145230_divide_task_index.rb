class DivideTaskIndex < ActiveRecord::Migration
  def change
  	remove_index :tasks, name: :tasks_title_desc_user_id_project_id
  	add_index :tasks, :title 
  	add_index :tasks, :description
  	add_index :tasks, :project_id 
  end
end
