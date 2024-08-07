class Book < CouchRest::Model::Base
  property :name, String
  property :summary, String
  property :date_of_publication, Date
  property :number_of_sales, Integer

  design do
    view :by_name
    view :by_date_of_publication
  end
end
