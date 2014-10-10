class Job < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :addresses, dependent: :destroy
  belongs_to :work_period

  def total_time
    self.addresses.map{|address| address.total_time}.inject(:+) || 0
  end

  def total_money
    self.addresses.map{|address| address.total_money}.inject(:+) || 0
  end

  def has_work?
    self.addresses.map {|address| address.work_logs.count}.inject(:+) > 0
  end
end
