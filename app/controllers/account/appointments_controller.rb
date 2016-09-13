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
      date = {
        day: params[:appointment]["appointment_on(3i)"].to_i,
        month: params[:appointment]["appointment_on(2i)"].to_i,
        year: params[:appointment]["appointment_on(1i)"].to_i
      }
      @girlfriend = Girlfriend.find(params[:girlfriend_id])
      @appointment = current_user.appointments.new(appoint_params)
      @appointment.girlfriend = @girlfriend

      if @girlfriend.appointments.pluck(:appointment_on).select { |appointment| appointment == Date.new(date[:year], date[:month], date[:day]) }.size > 0

        flash[:alert] = "No more availability for this day"
        render :new


      else
        @appointment.save

        redirect_to account_dashboard_path
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
