class ChangeMembersIndex < ActiveRecord::Migration
  def change
  	remove_index :members, name: :index_members_on_project_id_and_user_id
  	add_index :members, [:project_id, :user_id], unique: true
  end
end
