class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_cart
  helper_method :current_user_order

  private

  def current_cart
    @current_cart = Cart.find_by(user_id:current_user.id)
  end

  def current_user_order
    @current_order = Order.where(user_id:current_user.id)
  end
end
