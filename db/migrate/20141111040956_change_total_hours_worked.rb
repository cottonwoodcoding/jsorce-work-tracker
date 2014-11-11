class ChangeTotalHoursWorked < ActiveRecord::Migration
  def change
    rename_column :work_logs, :total_hours_worked, :total_time_worked
  end
end
