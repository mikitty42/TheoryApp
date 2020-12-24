class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_cart


  private

  def current_cart
    @current_cart = Cart.find_by(user_id:current_user.id)
  end
end
