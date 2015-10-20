
module Account
  class AppointmentsController < ApplicationController

    def index
      @appointments = current_user.appointments
    end

    def new
      @appointment = Appointment.new
    end

    def create
      @appointment = current_user.appointments.new(appoint_params)
      if @appointment.save
        redirect_to root_path
      else
        render :new
      end
    end

    def destroy
      @appointment = @current_user.appointments.find(params[:id])
      @appointment.destroy
      redirect_to root_path
    end

  private

    def appoint_params
      params.require(:appointment).permit(:appointment_on)
    end
  end
end
