class ProductsController < ApplicationController
  before_action :ensure_correct_user, { only: [:new,:create,:edit,:destroy]}
  before_action :set_product, only: [:show,:edit,:update]

  def index
    @products =  Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品を登録しました"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
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

  def set_product
    @product = Product.find(params[:id])
  end
end
