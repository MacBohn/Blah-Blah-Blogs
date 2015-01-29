class SessionsController < ApplicationController
    def create
      user = User.find_by_nickname(params[:user][:nickname])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
      end
        redirect_to root_path
    end

      def destroy
        session.delete(:user_id)
        redirect_to root_path, notice: "User successfully signed out"
      end


end
