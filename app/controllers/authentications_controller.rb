class AuthenticationsController < ApplicationController
  def create
    twitter_auth_hash = request.env["omniauth.auth"]
    user = User.find_by(twitter_auth_hash[:uid])
    # authentication = Authentication.find_or_create_by(user_id: user.id,provider: "twitter",uid: twitter_auth_hash["uid"])
    authentication = Authentication.find_by(user_id: user.id, provider: 'twitter', uid: twitter_auth_hash["uid"])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Your Twitter account was successfully Signed In.'
    else
      redirect_to sign_up_path
    end
  end

  def new
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "User successfully signed out"
  end
end
