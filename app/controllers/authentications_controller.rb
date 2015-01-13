class AuthenticationsController < ApplicationController
  def create
    twitter_auth_hash = request.env["omniauth.auth"]

    user = User.find_or_create_by(name: twitter_auth_hash["info"]["name"],
     nickname: twitter_auth_hash["info"]["nickname"])

    Authentication.find_or_create_by(user_id: user.id,
     provider: "twitter",
      uid: twitter_auth_hash["uid"])

    session[:user_id] = user.id
    redirect_to root_path, notice: 'Your Twitter account was successfully Signed In.'
  end

  def new
  end
end
