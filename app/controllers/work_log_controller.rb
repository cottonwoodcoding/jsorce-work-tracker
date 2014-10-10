class WorkLogController < ApplicationController
  before_action :authenticate_user!
  before_filter :check_admin, only: [:admin]

  def log_work
    job = Job.find(params[:job_id])
    address = Address.find_by_value(params[:work_log].delete(:address))
    work_log = WorkLog.new(params[:work_log])
    work_log.date = Time.now
    total_hours = (Time.parse(params[:work_log][:time_ended]) - Time.parse(params[:work_log][:time_started])) / 3600
    work_log.total_hours_worked = total_hours.to_s
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

  private

  def check_admin
    render text: 'You are unauthorized to view this page.', status: :unauthorized unless current_user.role == 'admin'
  end
end
