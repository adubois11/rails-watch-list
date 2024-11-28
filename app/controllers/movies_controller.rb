class MoviesController < ApplicationController
   # L'action index pour afficher la liste des films
   def index
    @movies = Movie.all  # Récupère tous les films de la base de données
  end
end
