User.create!(name:  "管理者",
             email: "admin@example.jp",
             password:  "111111",
             password_confirmation: "111111",
             admin: true)
Cart.create!(user_id: "1")
