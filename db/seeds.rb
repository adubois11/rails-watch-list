# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

require 'open-uri'
require 'json'

# URL de l'API TMDB via le proxy Le Wagon
url = 'https://tmdb.lewagon.com/movie/top_rated'
raw_data = URI.open(url).read  # Récupère les données de l'API

# Parser les données JSON pour obtenir les films
movies_data = JSON.parse(raw_data)['results']

# Pour chaque film récupéré, créer un enregistrement dans la base de données
movies_data.each do |movie|
  # Créer un nouveau film avec les attributs nécessaires
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}",
    rating: movie['vote_average']  # La note du film
  )
end

puts "Movies seeded successfully!"


