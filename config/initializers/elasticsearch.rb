if Rails.env.development? || Rails.env.production?
    Elasticsearch::Model.client = Elasticsearch::Client.new(
      url: ENV['ELASTICSEARCH_URL'] || 'http://localhost:9200',
      log: true,
      adapter: :net_http, # Cambiar a net_http
      transport_options: {
        request: {
          timeout: 5
        }
      }
    )
  end
  