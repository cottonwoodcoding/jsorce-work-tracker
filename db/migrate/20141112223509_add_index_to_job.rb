class AddIndexToJob < ActiveRecord::Migration
  def change
    add_index(:jobs, :name)
    add_index(:jobs, :created_by)
  end
end
