class PassedWorkPeriod < ActiveRecord::Base
  attr_accessible :work_period_ids
   serialize :work_period_ids
end
