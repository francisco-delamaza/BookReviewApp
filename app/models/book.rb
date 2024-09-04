class Book < CouchRest::Model::Base
    property :name, String
    property :summary, String
    property :date_of_publication, Date
    property :number_of_sales, Integer
    property :author_id, String


    # Método para obtener el autor del libro
    def author
      Author.find(author_id)
    end

    after_save :perform_post_save_actions
    

    def perform_post_save_actions
      update_cache
    end 

    def update_cache
      Rails.cache.delete("book_#{self.id}_average_score")
    end

    

    



    design do
      view :by_name
      view :by_date_of_publication
      view :by_author_id
      view :by_summary,
         map: "function(doc) {
           if (doc['type'] == 'Book' && doc['summary']) {
             doc['summary'].toLowerCase().split(' ').forEach(function(word) {
               emit(word, null);
             });
           }
         }"
    end
end
