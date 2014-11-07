class WorkPeriod < ActiveRecord::Base
  attr_accessible :date_started, :date_ended, :active
  belongs_to :user
  has_many :jobs, dependent: :destroy
  after_initialize :set_active

  def set_active
    self.active = true
  end

  def total_time
    self.jobs.map{|job| job.total_time}.inject(:+) || 0
  end

  def total_money
    self.jobs.map{|job| job.total_money}.inject(:+) || 0
  end
end