class PasswordResetsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            #Send Email
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: "If an accout with that email was found, we sent a link to reset pasword there."

    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to signin_path, alert: "Token expired"    
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to signin_path, notice: "Password reset Successful"
        else
            redirect_to :edit
        end
    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end