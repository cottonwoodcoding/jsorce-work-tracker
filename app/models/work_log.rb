class WorkLog < ActiveRecord::Base
  attr_accessible :work_description, :total_hours_worked, :time_started, :time_ended, :money_spent, :spent_description, :date
  belongs_to :address
  after_initialize :set_money_spent

  def set_money_spent
    self.money_spent = 0 if self.money_spent.blank?
  end
end
