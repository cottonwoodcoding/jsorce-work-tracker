class AddSpentDescriptionToWorkLog < ActiveRecord::Migration
  def change
    add_column :work_logs, :spent_description, :text
  end
end
