# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Bookmark.delete_all
puts 'Deleting bookmarks'

Movie.delete_all
puts 'Deleting movies'

List.delete_all
puts 'Deleting lists'

require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated'

response = URI.open(url).read
movies_data = JSON.parse(response)["results"]

movies_data.each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: movie["poster_path"],
    rating: movie["vote_average"]
  )
end

puts 'Creating movies'

puts "#{Movie.count} movies created"
