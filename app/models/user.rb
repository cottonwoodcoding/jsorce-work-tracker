class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :role
  devise :database_authenticatable, :registerable, :validatable
  has_many :work_periods
  has_many :appointments
  before_validation :activate
  validates_inclusion_of :status, :in => %w(active inactive)

  def current_work_period
    self.work_periods.where(active: true).first
  end

  def passed_work_periods
    self.work_periods.where(active: false)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def admin?
    @admin ||= self.role == 'admin'
  end

  def activate
    self.status = 'active'
  end

  def self.active
    where(status: 'active')
  end

  def self.inactive
    where(status: 'inactive')
  end

  def switch_status
    self.status = self.status == 'active' ? 'inactive' : 'active'
    self.save
  end
end