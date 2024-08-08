class Review < CouchRest::Model::Base
    property :book_id, String
    property :review, String
    property :score, Integer
    property :number_of_up_votes, Integer

    def book
      Book.find(book_id)
    end
  
    design do
      view :by_book_id
      view :by_score
      view :by_number_of_up_votes
    end
end
