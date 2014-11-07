class Address < ActiveRecord::Base
  attr_accessible :value, :created_by
  validates_uniqueness_of :created_by, scope: :value
  has_many :work_logs
  belongs_to :job

  def total_time
    self.work_logs.map{|wl| wl.total_hours_worked.to_i}.compact.inject(:+) || 0
  end

  def total_money
    self.work_logs.map{|wl| wl.money_spent.to_f}.compact.inject(:+) || 0
  end

  def has_work?
    self.work_logs.count > 0
  end
end