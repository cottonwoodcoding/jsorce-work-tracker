class JobController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    Job.create!(params[:job])
    redirect_to controller: :home, action: :index
  end
end
