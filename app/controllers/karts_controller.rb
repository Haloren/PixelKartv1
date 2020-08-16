class KartsController < ApplicationController

    def new
        @user = current_user

        @kart = Kart.new
        @kart.build_garage
    end

    def create

    end

private

    def kart_params
        params.require(:kart).permit(:driver, :color, :body, :wheels, :garage_id, garage_attributes: [:name])
    end

end
