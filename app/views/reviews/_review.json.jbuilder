json.extract! review, :id, :book_id, :review, :score, :number_of_up_votes, :created_at, :updated_at
json.url review_url(review, format: :json)
