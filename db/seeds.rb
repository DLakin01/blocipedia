require 'random_data'

# Create Users
10.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

# Create Wikis
10.times do
  Wiki.create!(
    title: "#{RandomData.random_word.capitalize} #{RandomData.random_word}",
    body: RandomData.random_paragraph,
    user: users.sample,
    file: RandomData.random_image,
    private: false
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
