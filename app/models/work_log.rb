class WorkLog < ActiveRecord::Base
  attr_accessible :work_description, :total_hours_worked, :time_started, :time_ended, :money_spent, :date
  belongs_to :address
end
