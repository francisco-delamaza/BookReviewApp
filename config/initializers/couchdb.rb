CouchRest::Model::Base.configure do |config|
  config.connection = {
    protocol: 'http',
    host: ENV['COUCHDB_HOST'] || '127.0.0.1',
    port: ENV['COUCHDB_PORT'] || 5984,
    username: ENV['COUCHDB_USER'] || 'admin',
    password: ENV['COUCHDB_PASSWORD'] || 'password'
  }
  config.database = ENV['COUCHDB_DATABASE'] || 'couchdb'
end
