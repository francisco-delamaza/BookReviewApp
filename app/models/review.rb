class Review < CouchRest::Model::Base
  require 'opensearch/model'

  property :book_id, String
  property :description, String
  property :score, Integer
  property :number_of_up_votes, Integer

  include OpenSearch::Model
  include OpenSearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :description, type: :text
      indexes :score, type: :integer
      indexes :number_of_up_votes, type: :integer
      indexes :book_id, type: :keyword
    end
  end

  def as_indexed_json(options = {})
    as_json(only: [:description, :score, :number_of_up_votes, :book_id])
  end

  # Método para obtener el libro relacionado con la reseña
  def book
    Book.find(book_id)
  end

  # Definición de vistas para CouchDB
  design do
    view :by_book_id
    view :by_score
    view :by_number_of_up_votes
  end
end
