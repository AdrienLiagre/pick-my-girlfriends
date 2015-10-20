
module Account
  class AppointmentController < ApplicationController

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
      @girlfriend = @current_user.girlfriends.find(params[:id])
      @girlfriend.destroy
      redirect_to root_path
    end

  private

    def appoint_params
      params.require(:appointment).permit(:appointment_on)
    end
  end
end
