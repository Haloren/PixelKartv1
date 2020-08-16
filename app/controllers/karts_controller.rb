class KartsController < ApplicationController

    def new
        @user = current_user

        @kart = Kart.new
        # byebug
        @kart.build_garage #Doesn't work? this should be a nested attribute?
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

    def index
        @user = current_user

        @karts = Kart.all
    end

    def show
        @user = current_user

        # byebug
        @kart = Kart.find_by(id: params[:id])
    end

private

    def kart_params
        params.require(:kart).permit(:name, :driver, :color, :body, :wheels, :garage_id, garage_attributes: [:name])
    end

end
