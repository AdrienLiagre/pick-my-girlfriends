module Account
  class GirlfriendsController < ApplicationController

    def index
      @girlfriends = current_user.girlfriends
    end

    def show
    end


    def new
     @cocktail = Cocktail.new
   end

   def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end
  end

  def destroy

    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture)
  end


  def pimp_id
    @pimp = Users.find(params[:id])
  end

end

end
