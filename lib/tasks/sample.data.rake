  
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
  end
end

def make_users
  admin = User.create!(user_name:     "Example User",
                      email:    "example@railstutorial.org",
                      password: "foobar",
                      comment: "hello!",
                      image: "face.png"
                      )
  50.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(user_name:     name,
                email:    email,
                password: password,
                comment: "hi!",
                image: "face.png"
                )
  end
end

def make_relationships
      users = User.all
      user  = users.first
      followed_users = users[2..20]
      followers      = users[3..20]
      statas = "waite"
      followed_users.each { |followed| user.follow!(followed) }
      followers.each      { |follower| follower.follow!(user) }
    end
    
#     def make_relationships
#   users = User.all
#   user  = users.first
#   followed_users = users[2..50]
#   followers      = users[3..40]
#   followed_users.each { |followed| user.follow!(followed) }
#   followers.each      { |follower| follower.follow!(user) }
# end