class ReviewsController < ApplicationController

    def new
        @user = current_user

        @kart = Kart.find_by(id: params[:kart_id])
        # byebug
        @review = @kart.build_review #undefined method build?
    end

    def index
        @user = current_user
    end

end