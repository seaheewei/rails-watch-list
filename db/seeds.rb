# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all

require "json"
require "open-uri"

urls = ["https://tmdb.lewagon.com/movie/top_rated", "https://tmdb.lewagon.com/movie/popular", "https://tmdb.lewagon.com/movie/now_playing"]

urls.each do |url|
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)["results"]

  movies.each do |movie|
    Movie.create!(
      {
        title: movie["title"],
        overview: movie["overview"],
        poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
        rating: movie["vote_average"]
      }
    )
  end
end
