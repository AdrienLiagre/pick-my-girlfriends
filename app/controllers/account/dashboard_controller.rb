module Account
  class DashboardController < ApplicationController
    def show
      @appointments = current_user.appointments
    end
  end
end
