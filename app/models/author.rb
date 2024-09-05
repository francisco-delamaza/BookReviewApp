class Author < CouchRest::Model::Base
    property :name, String
    property :date_of_birth, Date
    property :country_of_origin, String
    property :short_description, String
    property :photo_url, String

  
  
    # Define cómo obtener la URL del archivo cargado
    def photo_file=(file)
      uploader = BookCoverUploader.new
      uploader.store!(file)
      self.photo_url = uploader.filename
    end

    def photo_url
      "#{self[:photo_url]}"
    end

    design do
      view :by_name
      view :by_country_of_origin
    end
end
