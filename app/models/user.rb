class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :role
  devise :database_authenticatable, :registerable, :validatable
  has_many :work_weeks

  def current_work_week
    self.work_weeks.where(active: true).first
  end

  def passed_work_weeks
    passed_work_weeks = self.work_weeks.where(active: false)
    passed_work_weeks.empty? ? nil : passed_work_weeks
  end
end
