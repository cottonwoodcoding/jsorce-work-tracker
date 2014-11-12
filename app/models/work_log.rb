class WorkLog < ActiveRecord::Base
  attr_accessible :work_description, :total_time_worked, :time_started, :time_ended, :money_spent, :spent_description, :date, :break
  belongs_to :address
  after_initialize :set_money_spent
  before_save :calc_total_minutes_worked

  def set_money_spent
    self.money_spent = 0 if self.money_spent.blank?
  end

  def break_minutes
    self.break.to_s
  end

  def calc_total_minutes_worked
    break_seconds = self.break.blank? ? 0 : (self.break.to_i * 60)
    total_minutes = (Time.parse(self.time_ended) - Time.parse(self.time_started) - break_seconds) / 60
    self.total_time_worked = total_minutes
  end
end
