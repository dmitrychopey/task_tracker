class ChangeDateTypeToDateTimeInTask < ActiveRecord::Migration
  def change
  	change_column :tasks, :started_at, :datetime
  	change_column :tasks, :finished_at, :datetime

  end
end
