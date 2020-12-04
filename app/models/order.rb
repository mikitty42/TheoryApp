class Order < ApplicationRecord
  has_many :cart_items,dependent: :destroy
  has_many :order_products
  has_one :user
end
