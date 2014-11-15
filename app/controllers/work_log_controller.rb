class WorkLogController < ApplicationController
  before_action :authenticate_user!

  def create
    job = Job.find(params[:job_id])
    address = Address.find_or_create_by(job_id: job.id, created_by: current_user.id, value: params[:work_log].delete(:address))
    work_log = WorkLog.new(params[:work_log])
    work_log.date = Time.parse(params[:work_log][:date].gsub('-', '/'))
    job.addresses << address
    address.work_logs << work_log
    current_user.current_work_period.jobs << job
    flash[:notice] = "Your work has been added successfully."
    redirect_to controller: :home, action: :index
  end

  def update
    WorkLog.find(params[:id]).update_attributes!(params[:work_log])
    flash[:notice] = "Your work has been edited successfully."
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
