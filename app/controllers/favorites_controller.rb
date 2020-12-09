class FavoritesController < ApplicationController

  

  def create
    favorite = current_user.favorites.create(product_id: params[:product_id])
    redirect_to favorites_path,notice: 'お気に入り登録しました!'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to products_url,notice: 'お気に入りを解除しました'
  end
end
