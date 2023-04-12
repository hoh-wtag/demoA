class SessionsController < ApplicationController

    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Signed out'
        redirect_to root_path
    end
end