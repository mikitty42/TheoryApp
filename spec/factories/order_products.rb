FactoryBot.define do
  factory :order_product do
    user_id { 1 }
    order_id { 1 }
    product_id { 1 }
    quantity { 1 }
    price { 1 }
    status { 1 }
  end
end
