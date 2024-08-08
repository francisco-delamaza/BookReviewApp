class SalesByYear < CouchRest::Model::Base
    property :book_id, String
    property :year, Integer
    property :sales, Integer
  
    design do
      view :by_book_id
    end
end
