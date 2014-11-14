class AdminController < ApplicationController
  before_filter :users

  def work_period_actions
    @active_work_period_users = WorkPeriod.joins(:user).where(active: true).map{|wp| wp.user}
    @inactive_work_period_users = @users - @active_work_period_users
  end

  def passed_work_periods
    #TODO: should probably paginate this at some point
    @passed_work_periods = PassedWorkPeriod.all.sort_by{|work_period| work_period.updated_at}
  end

  def passed_work_period
    @passed_work_period = PassedWorkPeriod.find(params[:id])
    @work_periods = WorkPeriod.where(id: @passed_work_period.work_period_ids)
  end

  def end_active_work_periods
    users = User.where(id: params[:ids].split(','))
    work_period_ids = []
    users.each do |user|
      current_work_period = user.current_work_period
      current_work_period.conclude
      work_period_ids << current_work_period.id
    end
    PassedWorkPeriod.create!(work_period_ids: work_period_ids)
    flash[:notice] = "#{users.map{|u| u.full_name}.join(',')} Work Periods Were Ended Successfully."
    redirect_to action: :work_period_actions
  end

  def start_work_periods
    users = User.where(id: params[:users].values)
    users.each{ |user| user.work_periods.create!(date_started: Time.now) }
    flash[:notice] = "#{users.map{|u| u.full_name}.join(',')} Work Periods Were Started Successfully."
    redirect_to action: :work_period_actions
  end

  def work_logs
    @jobs = Job.all.to_a.uniq{|job| job.name}
  end

  def setup_appointments
    @open_appointments = OpenAppointment.all.sort_by{|open_appintment| open_appintment.name}
  end

  def work_logs_by_address
    @address_name = params[:address_value]
    @work_logs = WorkLog.joins(:address).where('TRIM(addresses.value) = ?', @address_name).order("addresses.created_by")
  end

  private

  def users
    @users = User.all.sort_by{|user| user.full_name}
  end
end
