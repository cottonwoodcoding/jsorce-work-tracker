class WorkPeriodController < ApplicationController
  def start
    current_user.work_periods << WorkPeriod.create!(date_started: Time.now)
    flash[:notice] = "Your work period has started!"
    redirect_to controller: :home, action: :index
  end

  def end
    work_period = current_user.current_work_period
    work_period.active = false
    work_period.date_ended = Time.now
    work_period.save!
    flash[:notice] = "Your work period has ended!"
    redirect_to controller: :home, action: :index
  end

  def add_work
    @job = Job.find_by_name(params[:job_name])
    @addresses = @job.addresses.sort()
    @work_log = WorkLog.new
  end

  def passed
    @passed = current_user.work_periods.where(active: false)
  end
end
