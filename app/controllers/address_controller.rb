class AddressController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @address = Address.new
  end

  def create
    job_name = params[:job_name]
    job = Job.find_by(name: job_name, created_by: current_user.id)
    address = Address.new(params[:address])
    address.created_by = current_user.id
    address.save
    job.addresses << address
    flash[:notice] = "Address was created successfully."
    redirect_to "/add_work/#{job_name}"
  end
end
