class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Sign in sucessful"
            redirect_to root_path
        else
            flash.now[:alert] = "Wrong email or password"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Signed out'
        redirect_to root_path
    end

end