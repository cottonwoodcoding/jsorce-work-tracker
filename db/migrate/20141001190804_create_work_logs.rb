class CreateWorkLogs < ActiveRecord::Migration
  def change
    create_table :work_logs do |t|
      t.date :date
      t.string :address
      t.text :work_description
      t.string :hours_worked
      t.string :tenant_name
      t.string :money_spent
      t.belongs_to :work_week

      t.timestamps
    end
  end
end
