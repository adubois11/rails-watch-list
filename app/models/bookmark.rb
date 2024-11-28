class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # Validation de l'unicité de la combinaison film_id et list_id
  validates :movie_id, uniqueness: { scope: :list_id, message: "This film has already been added to the list" }

  # Validation de la longueur du commentaire (minimum 6 caractères)
  validates :comment, length: { minimum: 6, message: "Comment must have at least 6 characters" }
end

