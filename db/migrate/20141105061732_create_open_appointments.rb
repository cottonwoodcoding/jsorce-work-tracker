class CreateOpenAppointments < ActiveRecord::Migration
  def change
    create_table :open_appointments do |t|
      t.string :name
      t.string :number
      t.string :address
      t.text :notes
      t.string :status
      t.string :status_notes
      t.date :scheduled
      t.date :completed

      t.timestamps
    end
  end
end
