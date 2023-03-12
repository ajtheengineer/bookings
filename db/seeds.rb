# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Place.create!(
  name: "Buena Vista Suites Orlando",
  city: "Orlando",
  description: "This hotel is an all-suite property 3 minutes' drive from the
 Walt Disney World Resort. Guests can enjoy the heated outdoor pool and a complimentary breakf
ast.",
  image_src: "https://cf.bstatic.com/xdata/images/hotel/square200/54304163.we
bp?k=0f75a7bc17dda892f039f08bd55aa1e29ec653ee7c0f2c25728eb925b197b7b5&o=&s=1"
)

Place.create!(
  name: "Royalton New York",
  city: "New York City",
  description: "This New York City hotel is located on 44th Street and is 1056 feet from Times Square. It features on-site dining and guest rooms with flat-screen TVs.",
  image_src: "https://cf.bstatic.com/xdata/images/hotel/square200/205408681.webp?k=5fadc4c7eb6396268845835a3e8cefb1f0b0b10bc3b17d679479cad049e5864a&o=&s=1"
)