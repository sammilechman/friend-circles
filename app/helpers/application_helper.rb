module ApplicationHelper
  def auth_token_input
    "<input type='hidden' name='authenticity_token'
        value='#{form_authenticity_token}'>".html_safe
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logged_in?
    !!current_user
  end


end
