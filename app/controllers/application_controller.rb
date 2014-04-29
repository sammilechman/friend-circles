class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  def login!(user)
    session[:token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:token] = nil
    @current_user = nil
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def post_params
    params.require(:post).permit(:body, :user_id, :circle_ids)
  end

  def link_params
    params.permit( links: [:url, :post_id] )
          .require(:links)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end

end
