class Review < CouchRest::Model::Base
  property :book_id, String
  property :review, String
  property :score, Integer
  property :number_of_up_votes, Integer

  # Incluir módulos de Elasticsearch para integración
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Configuración de los índices en Elasticsearch
  settings do
    mappings dynamic: false do
      indexes :review, type: :text
      indexes :score, type: :integer
      indexes :number_of_up_votes, type: :integer
      indexes :book_id, type: :keyword
    end
  end

  # Definir cómo se representará el modelo en Elasticsearch
  def as_indexed_json(options = {})
    as_json(only: [:review, :score, :number_of_up_votes, :book_id])
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
