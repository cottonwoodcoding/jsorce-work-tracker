class AddIndexToAddress < ActiveRecord::Migration
  def change
    add_index(:addresses, :value)
  end
end
