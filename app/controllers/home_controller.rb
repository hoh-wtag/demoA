class HomeController < ApplicationController
    def index
        flash.now[:success]="Logged in successfully"; # Using flash.now instead of flash so that the message does not go to the next pasge as cookie.
        flash[:alert]="Wrong email or password";
    end
end