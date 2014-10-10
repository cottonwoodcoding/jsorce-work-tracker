class AppointmentController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @appointments = user.appointments
  end

  def edit
    user = User.find(params[:user_id])
    @appointment = user.appointments.find(params[:appointment_id])
  end

  def show
    @appointment = current_user.appointments.find(params[:appointment_id])
  end

  def new
    @user = User.find(params[:user_id])
    @appointment = Appointment.new
  end

  def create
    user = User.find(params[:user_id])
    user.appointments.create!(params[:appointment])
    flash[:notice] = "Appointment for #{user.full_name} was created successfully."
    redirect_to controller: :admin, action: :setup_appointments
  end
end
