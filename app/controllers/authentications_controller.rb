class AuthenticationsController < ApplicationController
  def create
    twitter_auth_hash = request.env["omniauth.auth"]
    # determine if user exists with the nickname/name from twitter_auth
    user = User.find_by(nickname: twitter_auth_hash[:nickname])
      # if they dont exist, create that user and authentication
    if user.nil?
      user = User.create(nickname: twitter_auth_hash[:info][:nickname],
      name: twitter_auth_hash[:info][:name], password: twitter_auth_hash[:uid] )
      authentication = Authentication.create!(user_id: user.id, provider: 'twitter', uid: twitter_auth_hash["uid"])
      session[:user_id] = user.id
    else
      session[:user_id] = user.id
    end

    redirect_to root_path, notice: 'Your Twitter account was successfully Signed In.'

    # user = User.find_by(twitter_auth_hash[:uid])
    # # authentication = Authentication.find_or_create_by(user_id: user.id,provider: "twitter",uid: twitter_auth_hash["uid"])
    # if user
    #   session[:user_id] = user.id
    #   redirect_to root_path, notice: 'Your Twitter account was successfully Signed In.'
    # else
    #   redirect_to sign_up_path
    # end
  end

  def new
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "User successfully signed out"
  end
end
