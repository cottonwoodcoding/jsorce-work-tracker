class AddressController < ApplicationController
  def new
    @job_name = params[:job_name]
    @address = Address.new
  end

  def create
    job_name = params[:job_name]
    job = Job.find_by_name(job_name)
    address = Address.create!(params[:address])
    job.addresses << address
    flash[:notice] = "Address was created successfully."
    redirect_to "/add_work/#{job_name}"
  end
end
