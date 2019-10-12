# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!( name: 'Kelvin Liang',
              email: 'kelvin9877@gmail.com',
              address_country: "China",
              address_city: "Huizhou",
              gender: "Male",
              password: 'foobar',
              password_confirmation: 'foobar',
              created_at: Faker::Date.between(from: 100.days.ago, to: 1.days.ago))

User.create!( name: 'Michael Hartl',
              email: 'michael@railstutorial.org',
              address_country: "United States",
              address_city: "San Francisco",
              gender: "Male",
              password: 'foobar',
              password_confirmation: 'foobar',
              created_at: Faker::Date.between(from: 50.days.ago, to: 1.days.ago))

User.create!( name: 'Bright Okike',
              email: 'emehansome@gmail.com',
              address_country: "Nigeria",
              address_city: "Abuja",
              gender: "Male",
              password: 'foobar',
              password_confirmation: 'foobar',
              created_at: Faker::Date.between(from: 30.days.ago, to: 1.days.ago))

10.times do 
  name  = Faker::DcComics.name
  email = Faker::Internet.email(name: name, separators: '_')
  country = Faker::Address.country
  city = Faker::Address.city
  gender = Faker::Gender.binary_type
  password = 'foobar'
  User.create!( name: name,
                email: email,
                address_country: country,
                address_city: city,
                gender: gender,
                password: password,
                password_confirmation: password,
                created_at: Faker::Date.between(from: 90.days.ago, to: 1.days.ago) )
end  

50.times do |n|
 content = (n%2 == 0) ? Faker::Marketing.buzzwords : Faker::GreekPhilosophers.quote

 search_subjects = ['nature', 'water', 'travel', 'people', 'business', 'events', 'architecture', 'food', 'drink', 'fashion', 'art', 'health']
 search_term = search_subjects.sample
 picture = "https://source.unsplash.com/1600x900/?#{search_term}"
 user_id = User.all.ids.sample

 Post.create!( content: content,
                picture: picture,
                user_id: user_id,
                created_at: Faker::Date.between(from: 100.days.ago, to: 1.days.ago) )
end

100.times do 
  content = Faker::Lorem.sentence(word_count: 2, supplemental: false, random_words_to_add: 8)
  user_id = User.ids.sample
  post_id = Post.ids.sample

  Comment.create!( content: content,
                    user_id: user_id,
                    post_id: post_id,
                    created_at: Faker::Date.between(from: 60.days.ago, to: 6.minute.ago)
  )

end

User.ids.each do |user_id|
  likeable_type = "Post"
  cache, j = [], 0
  while j <= 36 do  
    t = Post.ids.sample 
    if cache.include?(t) 
      next
    end
    cache << t
    likeable_id = cache.last
    j += 1
    
    Like.create!( likeable_type: likeable_type,
                  likeable_id: likeable_id,
                  user_id: user_id,
                  created_at: Faker::Date.between(from: 35.days.ago, to: 1.minute.ago)
                )
  end

end

User.ids.each do |user_id|
  likeable_type = "Comment"
  cache, j = [], 0
  while j <= 42 do  
    t = Comment.ids.sample 
    if cache.include?(t) 
      next
    end
    cache << t
    likeable_id = cache.last
    j += 1
    
    Like.create!( likeable_type: likeable_type,
                  likeable_id: likeable_id,
                  user_id: user_id,
                  created_at: Faker::Date.between(from: 35.days.ago, to: 1.minute.ago)
                )
  end

end

User.ids.each do |user_id|
  cache, j = [], 0
  while j <= 5 do  
    temp_id = User.ids.sample 
    if cache.include?(temp_id) || user_id == temp_id
      next
    end
    cache << temp_id
    friend_id = cache.last
    confirmed = [true, false].sample
    j += 1
    
    Friendship.create!( user_id: user_id,
                        friend_id: friend_id,
                        confirmed: confirmed,
                        created_at: Faker::Date.between(from: 80.days.ago, to: 1.minute.ago) 
    )
  end

end










