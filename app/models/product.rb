class Product < ApplicationRecord
  has_many :carts,through: :cart_items
  belongs_to :user,dependent: :destroy
  has_many :favorites,dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :name,presence: true
  validates :price,presence: true
  validates :picture,presence: true
  scope :get_by_name, -> (name) { where("name LIKE ?", "%#{name}%")}


end
