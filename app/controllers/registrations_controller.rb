class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User was successfully created"
    else
      render signup_path
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :name, :password, :password_confirmation)
  end
end
