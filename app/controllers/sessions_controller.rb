class SessionsController < ApplicationController

    def index
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end