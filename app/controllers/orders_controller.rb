class OrdersController < ApplicationController
  before_action :ensure_correct_user, { only: :index}

  def index
    @all_orders = Order.all
  end

  def show
    @order_products = OrderProduct.where(user_id: current_user.id)
  end

  def new
    @order = Order.new
  end

  def create
    @cart_items = CartItem.where(cart_id: current_cart.id)
    @order = Order.new(order_params)
    @order.user.id = current_user.id
    @order.email = current_user.email
    @order.save

    @total_price = @cart_items.calc_total_price(@cart_items)

    @cart_items.each do |item|
      order
end
