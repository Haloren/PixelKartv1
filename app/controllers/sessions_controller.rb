class SessionsController < ApplicationController
   
    def index
        @user = current_user
        if logged_in?
          redirect_to user_path(@user.id)
        else
          redirect_to login_path
        end
    end

    def new
    end

    def create
        # byebug
        user = User.find_by(email: params[:user][:email])

        if user.try(:authenticate, params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else    
            flash[:message] = "Incorrect Email and/or Password"
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