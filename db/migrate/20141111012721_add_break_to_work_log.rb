class AddBreakToWorkLog < ActiveRecord::Migration
  def change
    add_column :work_logs, :break, :integer
  end
end
