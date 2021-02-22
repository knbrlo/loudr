# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# creator seeds
Creator.create(username: 'creator123', email: 'creator123@gmail.com', password: '123')

# singles
single = Single.create([{name: 'Single 1', duration: '3:11', category: 'R&B', released: true, release_date: 'Aug 14, 2020', play_count: 455, creator_id: 1 }])
single = Single.create([{name: 'Single 2', duration: '2:24', category: 'Rap', released: true, release_date: 'Sep 9, 2020', play_count: 5785, creator_id: 1 }])
single = Single.create([{name: 'Single 3', duration: '5:17', category: 'EDM', released: true, release_date: 'Nov 22, 2020', play_count: 35, creator_id: 1 }])

# albums
album = Album.create([{name: 'Album 1', category: 'Rock', release_date: 'Dec 21, 2020', released: true, creator_id: 1}])
album = Album.create([{name: 'Album 2', category: 'EDM', release_date: 'Jan 21, 2021', released: true, creator_id: 1}])
album = Album.create([{name: 'Album 3', category: 'Classical', release_date: 'Feb 21, 2021', released: true, creator_id: 1}])

# podcasts
podcast = Podcast.create([{name: 'Podcast 1', description: 'Podcast 1 description', duration: '3:08', category: 'educational', released: true, release_date: 'Aug 1, 2020', play_count: 5, creator_id: 1}])
podcast = Podcast.create([{name: 'Podcast 2', description: 'Podcast 2 description', duration: '4:18', category: 'programming', released: true, release_date: 'Sep 19, 2020', play_count: 10, creator_id: 1}])
podcast = Podcast.create([{name: 'Podcast 3', description: 'Podcast 3 description', duration: '5:29', category: 'investing', released: true, release_date: 'Oct 3, 2020', play_count: 2, creator_id: 1}])
podcast = Podcast.create([{name: 'Podcast 4', description: 'Podcast 4 description', duration: '6:11', category: 'stories', released: true, release_date: 'Nov 20, 2020', play_count: 44, creator_id: 1}])



# user seeds
User.create(username: 'user123', email: 'user123@gmail.com', password: '123')