class AddColumnsToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :user_id, :integer
    add_column :order_products, :order_id, :integer
    add_column :order_products, :product_id, :integer
  end
end
