class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorite_products
  end

  def create
    favorite = current_user.favorites.create(product_id: params[:product_id])
    redirect_to products_url,notice: 'お気に入りに追加しました'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to products_url,notice: 'お気に入りを解除しました'
  end
end
