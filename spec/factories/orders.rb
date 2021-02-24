FactoryBot.define do
  factory :order do
    name { "MyString" }
    address { "MyString" }
    email { "MyString" }
    status { 1 }
    user_id { 1 }
  end
end
