# db/seeds.rb

# Crear Autores
author1 = Author.create!(
  name: "Gabriel García Márquez",
  date_of_birth: "1927-03-06",
  country_of_origin: "Colombia",
  short_description: "Escritor colombiano, autor de 'Cien años de soledad'."
)

author2 = Author.create!(
  name: "Jane Austen",
  date_of_birth: "1775-12-16",
  country_of_origin: "Inglaterra",
  short_description: "Escritora inglesa, conocida por 'Orgullo y Prejuicio'."
)

# Crear Libros
book1 = Book.create!(
  name: "Cien años de soledad",
  summary: "Una novela épica sobre la historia de la familia Buendía.",
  date_of_publication: "1967-05-30",
  number_of_sales: 5000000,
  author_id: author1.id
)

book2 = Book.create!(
  name: "Orgullo y Prejuicio",
  summary: "Una historia de amor y prejuicios sociales en la Inglaterra del siglo XIX.",
  date_of_publication: "1813-01-28",
  number_of_sales: 2000000,
  author_id: author2.id
)

# Crear Reseñas
Review.create!(
  book_id: book1.id,
  review: "Una obra maestra de la literatura latinoamericana.",
  score: 5,
  number_of_up_votes: 100
)

Review.create!(
  book_id: book1.id,
  review: "Un poco confusa en algunos capítulos, pero excelente en general.",
  score: 4,
  number_of_up_votes: 50
)

Review.create!(
  book_id: book2.id,
  review: "Una historia cautivadora con personajes memorables.",
  score: 5,
  number_of_up_votes: 150
)

Review.create!(
  book_id: book2.id,
  review: "Un clásico imprescindible de la literatura inglesa.",
  score: 5,
  number_of_up_votes: 200
)

# Crear Ventas por Año
SalesByYear.create!(
  book_id: book1.id,
  year: 1967,
  sales: 1000000
)

SalesByYear.create!(
  book_id: book1.id,
  year: 1968,
  sales: 2000000
)

SalesByYear.create!(
  book_id: book2.id,
  year: 1813,
  sales: 500000
)

SalesByYear.create!(
  book_id: book2.id,
  year: 1814,
  sales: 1000000
)
