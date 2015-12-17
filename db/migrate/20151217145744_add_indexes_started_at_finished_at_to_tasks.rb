class AddIndexesStartedAtFinishedAtToTasks < ActiveRecord::Migration
  def change
  	add_index :tasks, :started_at
  	add_index :tasks, :finished_at
  end
end
