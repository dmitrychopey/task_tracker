class DivideProjectIndex < ActiveRecord::Migration
  def change
  	remove_index :projects, name: :index_projects_on_name_and_description
  	add_index :projects, :name 
  	add_index :projects, :description 
  end
end
