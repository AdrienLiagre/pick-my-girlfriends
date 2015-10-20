class GirlfriendsController < ApplicationController

  def index
    @girlfriends = Girlfriend.all
  end

  def show
    @girlfriend = Girlfriend.find(params[:id])
  end
end
