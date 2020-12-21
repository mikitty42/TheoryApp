class ProductsController < ApplicationController
  before_action :ensure_correct_user, { only: [:new,:create,:edit,:destroy]}
  before_action :not_logged_in

  def index
    @products = Product.all.page(params[:page]).per(10)
      if params[:name].present?
        @products = Product.get_by_name(params[:name]).page(params[:page]).per(10)
      end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      flash[:success] = "商品を登録しました"
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @favorite = current_user.favorites.find_by(product_id: @product.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        flash[:success] = "更新しました"
        redirect_to @product
      else
        render :edit
      end
  end

  def ensure_correct_user
    if current_user.admin?
    else
      flash[:notice] = "アクセス権限がありません"
      redirect_to root_url
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "商品を削除しました"
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:picture)
  end
end
