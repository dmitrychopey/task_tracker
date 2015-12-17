class AddStartedAtToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :started_at, :date
  end
end
