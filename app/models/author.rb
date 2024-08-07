class Author < CouchRest::Model::Base
    property :name, String
    property :date_of_birth, Date
    property :country_of_origin, String
    property :short_description, String
  
    design do
      view :by_name
      view :by_country_of_origin
    end
end
