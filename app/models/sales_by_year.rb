class SalesByYear < CouchRest::Model::Base
    property :book_id, String
    property :year, Integer
    property :sales, Integer

    def book
      Book.find(book_id)
    end
  
    design do
      view :by_book_id
      view :by_year
      view :by_sales
    end
end
