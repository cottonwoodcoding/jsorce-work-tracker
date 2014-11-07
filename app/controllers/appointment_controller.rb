class AppointmentController < ApplicationController
  before_action :appointment, only: [:edit, :show, :update, :delete]

  def index
    @user = User.find(params[:user_id])
    @appointments = @user.appointments
    @open_appointments = OpenAppointment.all
  end

  def edit
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @appointment = Appointment.new
  end

  def create
    @user = User.find(params[:user_id])
    @user.appointments.create!(params[:appointment])
    flash[:notice] = "Appointment for #{@user.full_name} was created successfully."
    redirect_to controller: :admin, action: :setup_appointments
  end

  def update
    begin
      @appointment.update_attributes!(params[:appointment])
      flash[:notice] = 'Appointment Updated Successfully'
    rescue => e
      flash[:notice] = "Appointment Not Updated - #{appointment.errors.full_massages.join(',')}"
    end
    redirect_to action: :edit
  end

  def delete
    @appointment.destroy
    flash[:notice] = "Appointment Removed Successfully"
    redirect_to :back
  end

  private

  def appointment
    @appointment = Appointment.find(params[:appointment_id])
  end
end