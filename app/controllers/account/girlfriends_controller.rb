module Account
  class GirlfriendsController < ApplicationController

    def index
      @girlfriends = current_user.girlfriends
    end

    def show
      @girlfriend = current_user.girlfriends.find(params[:id])
    end


    def new
     @girlfriend = current_user.girlfriends.new
    end

    def create
      @girlfriend = current_user.girlfriends.new(girlfriend_params)

      if @girlfriend.save
        redirect_to account_girlfriend_path(@girlfriend)
      else
        render :new
      end
    end

    def destroy
      @girlfriend = current_user.girlfriends.find(params[:id])
      @girlfriend.destroy
      redirect_to account_girlfriends_path
    end

  private

    def girlfriend_params
      params.require(:girlfriend).permit(:name, :description, :price, :age, :location, :availability, :nationality, :picture, :job)
    end


  # def pimp_id
  #   @pimp = Users.find(params[:id])
  # end

  end

end
