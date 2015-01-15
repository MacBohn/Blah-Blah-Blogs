class RegistrationsController < ApplicationController
  def create
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "User was successfully created"
    else
      render :new
    end
  end

  def params
    params.require(:user).permit(:nickname, :name, :password, :password_confirmation)
  end
end
