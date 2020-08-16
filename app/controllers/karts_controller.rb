class KartsController < ApplicationController

    def new
        @user = current_user

        @kart = Kart.new
        @kart.build_garage
    end

    def create
        @kart = Kart.new(kart_params)
        @kart.user_id = session[:user_id]

        if @kart.save
            redirect_to kart_path(@kart)
        else
            flash[:message] = @kart.errors.full_messages
            render :new
        end
    end

private

    def kart_params
        params.require(:kart).permit(:driver, :color, :body, :wheels, :garage_id, garage_attributes: [:name])
    end

end
