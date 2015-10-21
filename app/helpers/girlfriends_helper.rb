module GirlfriendsHelper
  def top_3_girlfriends
    Girlfriend.limit(3)
  end
end
