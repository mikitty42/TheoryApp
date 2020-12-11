class Product < ApplicationRecord
  has_many :carts,through: :cart_items
  belongs_to :user
  has_many :favorites,dependent: :destroy
  mount_uploader :picture, PictureUploader
end
