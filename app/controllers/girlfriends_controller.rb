class GirlfriendsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @girlfriends = Girlfriend.all

    @hash = Gmaps4rails.build_markers(@girlfriends) do |girlfriend, marker|
      marker.lat girlfriend.latitude
      marker.lng girlfriend.longitude
      marker.infowindow render_to_string(:partial => "/girlfriends/map_box", locals: {girlfriend: girlfriend})
    end
  end

  def show
    @girlfriend = Girlfriend.find(params[:id])
  end
end
