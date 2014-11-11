class AdminController < ApplicationController
  before_filter :users

  def work_logs
    @jobs = Job.all.to_a.uniq{|job| job.name}
  end

  def setup_appointments
    @open_appointments = OpenAppointment.all.sort_by{|open_appintment| open_appintment.name}
  end

  private

  def users
    @users = User.all.sort_by{|user| user.full_name}
  end
end
