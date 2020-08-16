class ReviewsController < ApplicationController

    def index
        @user = current_user
    end
    
    def new
        @user = current_user

        @kart = Kart.find_by(id: params[:kart_id])
        # byebug
        @review = @kart.reviews.build #review belongs_to a kart
    end

    def create
        @review = Review.create(review_params)
        redirect_to review_path(@review)
    end

private

    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :kart_id)
    end

end