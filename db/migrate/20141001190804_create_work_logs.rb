class CreateWorkLogs < ActiveRecord::Migration
  def change
    create_table :work_logs do |t|
      t.date :date
      t.text :work_description
      t.string :total_hours_worked
      t.string :time_started
      t.string :time_ended
      t.string :money_spent
      t.belongs_to :address

      t.timestamps
    end
  end
end
