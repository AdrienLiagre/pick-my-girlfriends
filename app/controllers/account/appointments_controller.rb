
module Account
  class AppointmentsController < ApplicationController

    def index
      @appointments = current_user.appointments
    end

    def new
      @girlfriend = Girlfriend.find(params[:girlfriend_id])
      @appointment = Appointment.new
    end

    def create
      @girlfriend = Girlfriend.find(params[:girlfriend_id])
      @appointment = current_user.appointments.new(appoint_params)
      @appointment.girlfriend = @girlfriend
      if @appointment.save
        redirect_to account_appointments_path
      else
        render :new
      end
    end

    def destroy
      @appointment = current_user.appointments.find(params[:id])
      @appointment.destroy
      redirect_to account_dashboard_path
    end

  private

    def appoint_params
      params.require(:appointment).permit(:appointment_on)

    end
  end
end
