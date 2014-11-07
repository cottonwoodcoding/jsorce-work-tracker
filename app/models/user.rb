class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :role
  devise :database_authenticatable, :registerable, :validatable
  has_many :work_periods
  has_many :appointments

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
end