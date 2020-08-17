class ReviewsController < ApplicationController

    def index
        @user = current_user
        # byebug
        if @kart = Kart.find_by(id: params[:kart_id]) #if we don't have an id it returns nil
            @reviews = @kart.reviews 
        else
            @reviews = Review.all
        end
    end

    def show
        @user = current_user
        # byebug
        @review = Review.find_by(id: params[:id])
        # byebug
    end
    
    def new
        @user = current_user

        @kart = Kart.find_by(id: params[:kart_id])
        # byebug
        @review = @kart.reviews.build #review belongs_to a kart
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        if @review.save #is this valid? then save
            redirect_to review_path(@review)
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end        
    end

private

    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :kart_id)
    end

end