# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
P_Article.delete_all
Article.delete_all
Comment.delete_all
Subcomment.delete_all 


admin = User.create(email: 'admin@admin.com', name: 'admin', password:'admin')

u1 = User.create(email: 'john@test.com', name: 'John', password:'test')
u2 = User.create(email: 'umer@test.com', name: 'Umer', password:'test')
u3 = User.create(email: 'mina@test.com', name: 'Mina', password:'test')

p1 = P_Article.create(title: "Lightning in the center of a cyclone, taken from ISS",
											img_url: "http://i.imgur.com/4cpd2gz.jpg")

a1 = Article.create(title: "A picture of the cratered edge of the Moon",
											img_url: "http://i.imgur.com/X8R8ost.jpg")
a2 = Article.create(title: "The Apollo Missions Moon Map",
											img_url: "http://i.imgur.com/LzMTAJu.png")
a3 = Article.create(title: "The resolution of Ceres over the next few weeks ",
											img_url: "http://i.imgur.com/PSFKgrw.jpg")


c1 = Comment.create(article_id: a1.id, user_id: u1.id, text:'This is amazing!')
c2 = Comment.create(article_id: a2.id, user_id: u2.id, text:'Wow, great map.. Cool to see where rovers went!')
c3 = Comment.create(article_id: a3.id, user_id: u3.id, text:'Cant wait to see Ceres...')


sc1 = Subcomment.create(comment_id: c1.id, user_id: u3.id, text:'I agree!')
sc1 = Subcomment.create(comment_id: c2.id, user_id: u2.id, text:'What is the scale here?')
sc1 = Subcomment.create(comment_id: c3.id, user_id: u1.id, text:'What is the timeframe here!?!?')