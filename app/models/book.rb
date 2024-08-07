class Book < CouchRest::Model::Base
  property :title, String
  property :author, String
  property :review, String
  property :published_at, Date
  timestamps!
end
