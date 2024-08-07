CouchRest::Model::Base.configure do |config|
  config.connection = {
    protocol: 'http',
    host: '127.0.0.1',
    port: 5984,
    username: 'admin',
    password: 'Admin12345'
  }
  config.database = 'book_review_app_development'
end

