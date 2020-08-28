class UsersController < ApplicationController
    before_action :set_user, only: [:how_to_use]
    
    def show 
        # byebug
        @user = User.find_by(id: params[:id]) 
        redirect_to root_path if !@user
    end

    def new
        @user = User.new
    end

    # SIGNUP
    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end
    end

    def how_to_use
    end

private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end