# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

c1 = Cat.create(name: "Pepper" , birth_date: "2015/01/20" , sex: "F" , color: "black" , description: "Pepper is an unfriendly cat, she clawed all of our furniture and spit in our eyes.")
c2 = Cat.create(name: "Salt" , birth_date: "1989/08/02" , sex: "M" , color: "white" , description: "Salt is a friendly cat. He is getting up there in years, so I would recommend that you keep his IV inserted while you are playing with him.")
c3 = Cat.create(name: "Oregano" , birth_date: "1654/03/15" , sex: "I" , color: "green" , description: "Oregano is a mystical being. It likes condensed milk.")

CatRentalRequest.destroy_all

catrequest1 = CatRentalRequest.create(cat_id: c1.id, start_date: "2017-04-18", end_date:"2017-04-21", status: "PENDING" )
catrequest2 = CatRentalRequest.create(cat_id: c2.id, start_date: "2017-04-15", end_date:"2017-04-18", status: "APPROVED")
catrequest3 = CatRentalRequest.create(cat_id: c3.id , start_date: "2017-04-05", end_date:"2017-04-08")
catrequest4 = CatRentalRequest.create(cat_id: c3.id , start_date: "2017-04-06", end_date:"2017-04-08")
catrequest5 = CatRentalRequest.create(cat_id: c3.id , start_date: "2017-04-07", end_date:"2017-04-12")
