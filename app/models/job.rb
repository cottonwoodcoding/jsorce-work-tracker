class Job < ActiveRecord::Base
  attr_accessible :name, :created_by
  validates :name, :created_by, presence: true
  validates :name, :uniqueness => {:scope => [:created_by, :work_period_id]}
  has_many :addresses, dependent: :destroy
  has_many :work_periods

  def total_time
    self.addresses.map{|address| address.total_time}.inject(:+) || 0
  end

  def total_money
    self.addresses.map{|address| address.total_money}.inject(:+) || 0
  end

  def any_has_work?
    Job.where(name: self.name).map{|job| job.addresses.map {|address| address.work_logs.count}.inject(:+) > 0 rescue 0}.include? true
  end

  def has_work?
    self.addresses.map {|address| address.work_logs.count}.inject(:+) > 0 rescue 0
  end
end
