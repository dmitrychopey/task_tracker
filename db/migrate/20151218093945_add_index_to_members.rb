class AddIndexToMembers < ActiveRecord::Migration
  def change
  	add_index :members, [:project_id, :user_id]
  end
end
