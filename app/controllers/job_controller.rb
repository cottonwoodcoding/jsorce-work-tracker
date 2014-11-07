class JobController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    job =  Job.new(params[:job])
    current_user.current_work_period.jobs << job
    job.created_by = current_user.id
    job.save
    redirect_to controller: :home, action: :index
  end
end
