class AddCreatedByToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :created_by, :integer
  end
end
