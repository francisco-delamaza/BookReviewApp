class Review < CouchRest::Model::Base
    property :book_id, String
    property :review, String
    property :score, Integer
    property :number_of_up_votes, Integer
  
    design do
      view :by_book_id
      view :by_score
    end
end
