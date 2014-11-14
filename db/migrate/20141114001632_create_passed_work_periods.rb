class CreatePassedWorkPeriods < ActiveRecord::Migration
  def change
    create_table :passed_work_periods do |t|
      t.text :work_period_ids

      t.timestamps
    end
  end
end
