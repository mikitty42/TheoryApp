User.create!(name:  "管理者",
             email: "admin@example.jp",
             password:  "111111",
             password_confirmation: "111111",
             admin: true)
Cart.create!(user_id: "1")
100.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end
