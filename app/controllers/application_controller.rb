class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_signed_in
        redirect_to signin_path, alert: "You need to be signed in to access that." if Current.user.nil?
    end
end
