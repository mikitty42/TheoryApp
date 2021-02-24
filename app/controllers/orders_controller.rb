class OrdersController < ApplicationController
  before_action :ensure_correct_user, {only: [:index]}

  def index
    @all_orders = Order.all
  end

  def show
    @order_products = OrderProduct.where(user_id:current_user.id)
  end

  def new
  	@order = Order.new
  end

  def create
    @cart_items = CartItem.where(cart_id:current_cart.id)
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.email = current_user.email
    @order.save

    @total_price = @cart_items.calc_total_price(@cart_items)

    @cart_items.each do |item|
      order_product = OrderProduct.create
      order_product.order_id = @order.id
      order_product.user_id = current_user.id
      order_product.product_id = item.product_id
      order_product.quantity = item.quantity
      order_product.price = item.product.price
      order_product.save!
    end

    @cart_items.each do |item|
      CartItem.delete(item.id)
    end

    UserMailer.order_check(current_user,@cart_items,@total_price).deliver_now
    flash[:info] = "ご注文内容をメールで送信しました"
    redirect_to current_cart
  end

  def destroy
    @order.destroy
  end

  def toggle_status
    @all_orders = Order.all
    @order = Order.find(params[:id] || params[:order_id])
    @order.toggle_status!
    flash[:info] = '注文ステータスを更新しました'
    redirect_to orders_path
  end

  def ensure_correct_user
    if current_user.admin?
    else
      flash[:notice] = "アクセス権限がありません"
      redirect_to root_url
    end
  end

  private

    def order_params
      params.require(:order).permit(:name, :address)
    end
end
