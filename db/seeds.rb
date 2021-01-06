  #local media
require "csv"

CSV.foreach('db/local_media.csv', headers: true) do |row|
  LocalMedium.create(
    prefecture: row['prefecture'],
    site: row['site'],
    site_url: row['site_url'],
    intro: row['intro']
  )
end


  #users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
   
   #microposts           
#   users = User.order(:created_at).take(6)
#   50.times do
#     content = Faker::Lorem.sentence(word_count: 5)
#     users.each { |user| user.microposts.create!(content: content) }
# end

   #relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

