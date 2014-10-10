class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :value
      t.belongs_to :job

      t.timestamps
    end
  end
end
