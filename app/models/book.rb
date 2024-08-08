class Book < CouchRest::Model::Base
    property :author_id, String
    property :name, String
    property :summary, String
    property :date_of_publication, Date
    property :number_of_sales, Integer
  
    design do
      view :by_author
    end
end
