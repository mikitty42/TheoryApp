class AddIndexToCartItemsCartId < ActiveRecord::Migration[5.2]
  def change
    add_index :cart_items, :product_id
  end
end
