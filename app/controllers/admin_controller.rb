class AdminController < ApplicationController
  before_filter :users

  def work_logs
    @jobs.uniq{|job| job.name}
  end

  def setup_appointments
    @open_appointments = OpenAppointment.all
  end

  private

  def users
    @users = User.all
  end
end
