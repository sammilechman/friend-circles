class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])

    if @user
      login!(@user)
      redirect_to user_url @user
    else
      flash.now[:errors] = ["Username/password combination incorrect."]
      @user = User.new(username: user_params[:username])
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
