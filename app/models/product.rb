class Product < ApplicationRecord
  has_many :carts,through: :cart_items
  belongs_to :user
  has_many :favorites,dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :name,presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1000, less_than_or_equal_to: 1000000}
  validates :picture,presence: true
  scope :get_by_name, -> (name) { where("name LIKE ?", "%#{name}%")}


end
