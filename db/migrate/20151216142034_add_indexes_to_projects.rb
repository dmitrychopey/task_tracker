class AddIndexesToProjects < ActiveRecord::Migration
  def change
  	add_index :projects, [:name,:description]
  end
end
