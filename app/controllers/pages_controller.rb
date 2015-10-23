class PagesController < ApplicationController

  def home
    @girlfriends = Girlfriend.limit(3)
  end
end
