class WorkWeek < ActiveRecord::Base
  attr_accessible :date_started, :date_ended, :active
  belongs_to :user
  has_many :work_logs, dependent: :destroy
  after_initialize :set_active

  def set_active
    self.active = true
  end
end
