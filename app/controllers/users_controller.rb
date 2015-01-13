class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create
  end
  def params
    params.require(:user).permit(:nickname, :name,)
  end
end
