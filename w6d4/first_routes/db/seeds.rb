# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tony = User.new(username: 'tony_tiger')
sam = User.new(username: 'tucan_sam')
lucky = User.new(username: 'lucky_leprechaun')
peanut = User.new(username: 'mr_peanut')

artworks = Artwork.new([ { title: "frosted_flakes", image_url: "2021.png", artist_id: tony.id }, { title: "froot_loops", image_url: "2020.png", artist_id: sam.id }, { title: "lucky_charms", image_url: "2019.png", artist_id: lucky.id }, { title: "peanuts", image_url: "2018.png", artist_id: peanut.id }])

artwork_shares = ArtworkShare.new([{ viewer_id: tony.id, artwork_id: 4}, { viewer_id: sam.id, artwork_id: 3}, { viewer_id: lucky.id, artwork_id: 2}, { viewer_id: peanut.id, artwork_id: 1}])