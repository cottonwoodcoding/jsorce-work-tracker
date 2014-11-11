class WorkLog < ActiveRecord::Base
  attr_accessible :work_description, :total_minutes_worked, :time_started, :time_ended, :money_spent, :spent_description, :date, :break
  belongs_to :address
  after_initialize :set_money_spent

  def set_money_spent
    self.money_spent = 0 if self.money_spent.blank?
  end

  def break_minutes
    self.break / 60 rescue 0
  end
end
