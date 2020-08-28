class SessionsController < ApplicationController
    before_action :set_user, only: [:index]
    
    def index
        if logged_in?
          redirect_to user_path(@user.id)
        else
          redirect_to login_path
        end
    end

    def new
    end

    # LOGIN
    def create
        # byebug
        user = User.find_by(email: params[:user][:email])

        # @user && @user.authenticate(params[:user][:password])
        if user.try(:authenticate, params[:user][:password]) # activesupport method if the user is !nil authenticate params
            session[:user_id] = user.id
            redirect_to user_path(user)
        else    
            flash[:message] = "Incorrect Email and/or Password" # maybe add a note that they may have logged in with Google?
            redirect_to login_path
        end
    end

    def create_omniauth
        # byebug
        omniauth = request.env['omniauth.auth'][:info]
        user = User.find_or_create_by(email: omniauth[:email]) do |u|
            u.name = omniauth[:name] 
            u.password = SecureRandom.hex # generates a random hexadecimal string
        end
        session[:user_id] = user.id
        @user = current_user
        redirect_to user_path(@user.id)
    end

    def destroy
        session.clear
        redirect_to root_path
    end
    
end