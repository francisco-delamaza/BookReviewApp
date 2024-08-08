require 'faker'

# Limpieza de la base de datos
Author.all.each(&:destroy)
Book.all.each(&:destroy)
Review.all.each(&:destroy)
SalesByYear.all.each(&:destroy)

# Generación de autores
50.times do
  Author.create!(
    name: Faker::Book.author,
    date_of_birth: Faker::Date.birthday(min_age: 25, max_age: 90),
    country_of_origin: Faker::Address.country,
    short_description: Faker::Lorem.sentence(word_count: 8)
  )
end
# Generación de libros
authors = Author.all.to_a
authors.shuffle.each do |author|
  6.times do
  book = Book.create!(
    name: Faker::Book.title,
    summary: Faker::Lorem.paragraph(sentence_count: 3),
    date_of_publication: Faker::Date.between(from: '1900-01-01', to: Date.today),
    number_of_sales: Faker::Number.between(from: 1000, to: 100000),
    author_id: author.id
  )

  # Generación de reseñas para cada libro
  rand(1..10).times do
    Review.create!(
      book_id: book.id,
      review: Faker::Lorem.paragraph(sentence_count: 1),
      score: rand(1..5),
      number_of_up_votes: Faker::Number.between(from: 1, to: 100)
    )
  end

  # Generación de ventas por año para cada libro
  start_year = book.date_of_publication.year
  (start_year..(start_year + 5)).each do |year|
    SalesByYear.create!(
      book_id: book.id,
      year: year,
      sales: Faker::Number.between(from: 1000, to: 50000)
    )
  end
end
end


puts "Datos generados con éxito!"
