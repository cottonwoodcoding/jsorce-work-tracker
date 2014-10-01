class WorkLog < ActiveRecord::Base
  attr_accessible :address, :work_description, :hours_worked, :tenant_name, :money_spent, :date
  belongs_to :work_week
end
