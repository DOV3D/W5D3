# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(user_name: "Snigdha", password: "helllllo")
u2 = User.create!(user_name: "Darrick", password: "byebye")

c1 = Cat.create!(birth_date: "1/1/2020", color: "orange", name: "Snigdha's cat", sex: "M", description: "large cat", user_id: u1.id)
c2 = Cat.create!(birth_date: "1/5/2020", color: "orange", name: "Darrick's cat", sex: "M", description: "large cat2", user_id: u2.id)