class OpenAppointmentController < ApplicationController
  before_action :appointment, only: [:edit, :show, :update, :delete, :claim]

  def edit
  end

  def show
  end

  def new
    @appointment = OpenAppointment.new
  end

  def create
    OpenAppointment.create!(params[:open_appointment])
    flash[:notice] = "New Open Appointment was created successfully."
    redirect_to controller: :admin, action: :setup_appointments
  end

  def update
    begin
      @appointment.update_attributes!(params[:open_appointment])
      flash[:notice] = 'Appointment Updated Successfully'
    rescue => e
      flash[:notice] = "Appointment Not Updated - #{appointment.errors.full_massages.join(',')}"
    end
    if params[:goBack]
      redirect_to '/view_open_appointments'
    else
      redirect_to setup_appointments_path
    end
  end

  def delete
    @appointment.destroy
    flash[:notice] = "Open Appointment Removed Successfully"
    redirect_to controller: :admin, action: :setup_appointments
  end

  def claim
    current_user.appointments.create!(params[:open_appointment])
    @appointment.destroy
    flash[:notice] = "Appointment for #{current_user.full_name} was claimed successfully."
    redirect_to "/appointments/#{current_user.id}"
  end

  private

  def appointment
     @appointment = OpenAppointment.find(params[:appointment_id]) rescue nil
  end
end
