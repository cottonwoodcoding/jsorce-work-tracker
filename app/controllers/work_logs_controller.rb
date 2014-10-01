class WorkLogsController < ApplicationController
  before_action :authenticate_user!
  before_filter :check_admin, only: [:admin]

  def admin
    @users = User.all
  end

  def log_work
    work_log = WorkLog.new(params[:work_log])
    work_log.date = Time.now
    current_user.current_work_week.work_logs << work_log
    flash[:notice] = "Your work has been added successfully."
    redirect_to controller: :home, action: :index
  end

  private

  def check_admin
    render text: 'You are unauthorized to view this page.', status: :unauthorized unless current_user.role == 'admin'
  end
end
