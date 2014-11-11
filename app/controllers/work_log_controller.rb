class WorkLogController < ApplicationController
  before_action :authenticate_user!

  def log_work
    user_break = params[:work_log][:break]
    job = Job.find(params[:job_id])
    address = Address.find_or_create_by(created_by: current_user.id, value: params[:work_log].delete(:address))
    work_log = WorkLog.new(params[:work_log].except(:break))
    work_log.date = Time.now
    break_seconds = user_break.blank? ? 0 : (user_break.split(' ').first.to_i * 60)
    total_hours = (Time.parse(params[:work_log][:time_ended]) - Time.parse(params[:work_log][:time_started]) - break_seconds) / 3600
    work_log.total_hours_worked = total_hours
    work_log.break = break_seconds
    job.addresses << address
    address.work_logs << work_log
    current_user.current_work_period.jobs << job
    if params['_method'] == 'patch'
      flash[:notice] = "Your work has been edited successfully."
    else
      flash[:notice] = "Your work has been added successfully."
    end
    redirect_to controller: :home, action: :index
  end

  def delete
    WorkLog.find(params[:work_log_id]).destroy!
    flash[:notice] = "Work Log was successfully deleted!"
    render nothing: true
  end

  def edit
    @work_log = WorkLog.find(params[:work_log_id])
    @job = @work_log.address.job
    @addresses = @job.addresses
  end
end
