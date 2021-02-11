# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Creator.create(username: 'creator123', email: 'creator123@gmail.com', password: '123')


albums = Album.create([{name: 'Album 1', category: 'Rock', release_date: 'Release Date 1', creator_id: 1}])