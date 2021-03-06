module SessionsHelper


  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    session[:cart_id] = nil
  end

  def current_user?(user)
    user == current_user
  end

  def not_logged_in
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
