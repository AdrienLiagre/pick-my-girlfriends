class GirlfriendsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @girlfriends = Girlfriend.all

    @markers = Gmaps4rails.build_markers(@girlfriends) do |girlfriend, marker|
      marker.lat girlfriend.latitude
      marker.lng girlfriend.longitude
    end
  end

  def show
    @girlfriend = Girlfriend.find(params[:id])
  end
end
