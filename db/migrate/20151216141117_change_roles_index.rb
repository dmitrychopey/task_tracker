class ChangeRolesIndex < ActiveRecord::Migration
  def change
  	  remove_index :roles, name: :index_roles_on_name_and_resource_type_and_resource_id
  	  add_index :roles, [:name, :resource_type, :resource_id], unique: true,  name: 'index_roles_on_name_and_resource_type_and_resource_id'
  end
end
