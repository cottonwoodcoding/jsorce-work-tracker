class CreateWorkWeeks < ActiveRecord::Migration
  def change
    create_table :work_weeks do |t|
      t.date :date_started
      t.date :date_ended
      t.boolean :active
      t.belongs_to :user
      t.timestamps
    end
  end
end
