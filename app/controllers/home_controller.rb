class HomeController < ApplicationController
    def index
        #flash.now[:success]="Logged in successfully"; # Using flash.now instead of flash so that the message does not go to the next pasge as cookie.
        #flash.now[:alert]="Wrong email or password";

        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end
end