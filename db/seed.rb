require 'faker'
require 'couchrest_model'

server = CouchRest.new
db = server.database!("assignment_1")

authors = []
50.times do 
    author = {name: Faker::Name.name,
                date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 2000),
                country_of_origin: Faker::Address.country,
                short_description: Faker::Lorem.sentence}
    authors.append(author)
end

authors.each do |author_data|
    db.save_doc(author_data.merge(type: 'Author'))
end

books = []
authors.each do |author|
    6.times do
        book = {author_id: author.id,
                    name: Faker::Book.title,
                    summary: Faker::Lorem.sentence,
                    date_of_publication: Faker::Date.birthday(min_age: 0, max_age: 2000),
                    number_of_sales: Faker::Number.digit(4)}
        books.append(book)
    end
end

books.each do |book_data|
    db.save_doc(book_data.merge(type: 'Book'))
end

books.each do |book|
    reviews = []
    rand(1..11).times do
        review = {book_id: book.id,
                review: Faker::Lorem.sentence,
                score: Faker::Number.within(range: 1..5),
                number_of_up_votes: Faker::Number.number}
        reviews.append(review)
    end
    sales = []
    5.times do
        sale = {book_id: book.id,
                year: Faker::Number.within(range: 2000..2024),
                sales: Faker::Number.number}
        sales.append(sale)
    end
    reviews.each do |review_data|
        db.save_doc(review_data.merge(type: 'Review'))
    end
    sales.each do |sale_data|
        db.save_doc(sale_data.merge(type: 'SalesByYear'))
    end
end