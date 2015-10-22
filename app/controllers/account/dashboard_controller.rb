module Account
  class DashboardController < ApplicationController
    def show
      @appointments = Appointment.all
    end
  end
end
