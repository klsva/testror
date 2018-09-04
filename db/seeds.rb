# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Theme.delete_all
#Theme.reset_pk_sequence
#Theme.create(
#    [
#        {name: 'Одни велосипеды'},
#        {name: 'Другие велосипеды'}
#    ]
#)

#создание пользователей
User.create!(name: 'Admin User',
              email: 'admin@admin.com',
              password: '123456',
              password_confirmation: '123456',
              admin: true)
45.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = 'password'
  User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

#создание альбомов
users = User.order(:created_at).take(6)
10.times do
  album_name = Faker::Lorem.sentence(1)
  album_description = Faker::Lorem.sentence(5)
  users.each {|user| user.albums.create!(album_name: album_name,
                                        album_description: album_description)}
end

#фотографии в альбомы
# file = (Faker::Number.between(1, 10)).to_s + '.jpeg'
# a = ['1.jpeg', '2.jpeg', '3.jpeg', '4.jpeg', '5.jpeg']
# file = a.shuffle.first
#albums = Album.all
#5.times do
#  file = 'asdfg'
#  ave_value = Faker::Number.between(1,10)
#  albums.each {|album| album.photos.create(file: file,
#                                            ave_value: ave_value)}
#end

#взаимоотношения следования
users = User.all
user = users.first
following = users[2..15]
followers = users[3..10]
following.each { |followed| user.follow(followed)}
followers.each { |follower| follower.follow(user)}

