class CartItem < ApplicationRecord
  balongs_to :product
  balongs_to :cart
end
