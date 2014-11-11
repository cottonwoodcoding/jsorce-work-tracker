class AdminController < ApplicationController
  before_filter :users

  def work_logs
    @jobs = Job.all.to_a.uniq{|job| job.name}
  end

  def setup_appointments
    @open_appointments = OpenAppointment.all.sort_by{|open_appintment| open_appintment.name}
  end

  def work_logs_by_address
    @address_name = params[:address_value]
    @work_logs = WorkLog.joins(:address).where('addresses.value = ?', @address_name).order("addresses.created_by")
  end

  private

  def users
    @users = User.all.sort_by{|user| user.full_name}
  end
end
