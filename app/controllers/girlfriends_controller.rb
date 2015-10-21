class GirlfriendsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @girlfriends = Girlfriend.all
  end

  def show
    @girlfriend = Girlfriend.find(params[:id])
  end
end
