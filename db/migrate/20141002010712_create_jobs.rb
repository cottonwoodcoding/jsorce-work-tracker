class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.belongs_to :work_period

      t.timestamps
    end
  end
end
