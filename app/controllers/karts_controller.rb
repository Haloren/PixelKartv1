class KartsController < ApplicationController
    before_action :set_user, only: [:index, :show, :new, :create]

    def index
        @karts = Kart.avg_rating 
    end

    def show
        # byebug
        @kart = Kart.find_by(id: params[:id])
    end

    def new
        @kart = Kart.new
        # byebug
        @kart.build_garage 
    end

    def create
        # byebug
        @kart = Kart.new(kart_params)
        @kart.user_id = session[:user_id]

        if @kart.save
            redirect_to kart_path(@kart)
        else
            @kart.errors.full_messages
            render :new
        end
    end

private

    def kart_params
        params.require(:kart).permit(:name, :driver, :color, :body, :wheels, :garage_id, garage_attributes: [:name])
    end

end
