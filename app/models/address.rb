class Address < ActiveRecord::Base
  attr_accessible :value, :created_by
  validates :created_by, :uniqueness => {:scope => [:value, :job_id]}
  has_many :work_logs
  belongs_to :job

  def total_time
    self.work_logs.map{|wl| wl.total_time_worked.to_f}.compact.inject(:+) || 0
  end

  def total_money
    self.work_logs.map{|wl| wl.money_spent.to_f}.compact.inject(:+) || 0
  end

  def has_work?
    self.work_logs.count > 0
  end
end