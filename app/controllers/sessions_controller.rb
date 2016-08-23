class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    if @user.provider == "twitter"
      redirect_to "/tweets"
    elsif
      @user.provider == 'tumblr'
      redirect_to "/tumblrposts"
    elsif
      @user.provider == 'facebook'
      redirect_to '/facebookposts'
    else
      redirect_to root_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end


end
