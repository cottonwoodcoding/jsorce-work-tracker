class AddCreatedByToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :created_by, :integer
  end
end
