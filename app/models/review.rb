class Review < CouchRest::Model::Base
  property :book_id, String
  property :review, String
  property :score, Integer
  property :number_of_up_votes, Integer

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
