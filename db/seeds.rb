User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


Memory.create!(name: "Example User",
                title: "旅の思い出",
                content: "ーーーに行ってきました。")

99.times do |n|
  name  = Faker::Name.name
  title = "旅の思い出#{n+1}"
  content = "---に行ってきました。"
  User.create!(name: name,
                title: title,
                content: content)
end