class User < ApplicationRecord
  has_one :cart
  has_many :products
  has_many :orders
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product
  has_many :messages,dependent: :destroy
  has_secure_password
  validates :password,presence: true,length: { minimum: 6 }
  validates :name,presence: true,length: { maximum: 30}
  validates :email,presence: true,uniqueness: true,length: { maximum: 255},
                              format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                              before_validation { email.downcase! }

end
