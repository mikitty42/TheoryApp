class Product < ApplicationRecord
  has_many :carts,through: :cart_items
  has_many :favorites,dependent: :destroy
  has_many :favorite_products,through: :favorites,source: :user
  mount_uploader :picture, PictureUploader
end
