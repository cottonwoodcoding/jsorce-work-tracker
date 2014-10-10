class Appointment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :number, :address, :scheduled, :completed, :notes, :status, :status_notes
  validates :name, :number, :address, :status, presence: true
  validates :status, inclusion: {in: ['not scheduled', 'scheduled', 'no answer', 'other', 'completed']}
  after_create :set_scheduled
  after_initialize :set_status

  def set_scheduled
    self.scheduled = Time.now
    self.save
  end

  def set_status
    self.status = 'not scheduled'
  end
end
