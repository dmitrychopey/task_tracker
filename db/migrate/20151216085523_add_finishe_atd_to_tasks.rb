class AddFinisheAtdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :finished_at, :date
  end
end
