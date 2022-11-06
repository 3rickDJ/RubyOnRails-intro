# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Article.destroy_all
Article.create!([{
  title: "Git by Erick",
  body: "There is a great free ebook about git written by Chaco"
},
{
  title: "Go Hugo",
  body: "If you want to really understand what really is hugo, see it's documentation, it's fantastic. Well, almost"
}])
p "Created #{Article.count} articles"
