class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def top_rated_books
    @books = Review.all
      .group_by(&:book_id)
      .map do |book_id, reviews|
        book = Book.get(book_id)
        avg_score = reviews.map(&:score).sum / reviews.size.to_f
        highest_review = reviews.max_by(&:score)
        lowest_review = reviews.min_by(&:score)
        most_popular_review = reviews.max_by(&:number_of_up_votes)
        
        {
          book: book,
          avg_score: avg_score,
          highest_review: highest_review,
          lowest_review: lowest_review,
          most_popular_review: most_popular_review
        }
      end
      .sort_by { |b| b[:avg_score] }
      .reverse
      .take(10)
  end
  def top_selling_books
    @books = SalesByYear.all
      .group_by(&:book_id)
      .map do |book_id, sales|
        book = Book.get(book_id)
        total_sales = sales.sum(&:sales)
        author_sales = sales.select { |s| Book.get(s.book_id).author_id == book.author_id }.sum(&:sales)
        top_5_sales_year = sales.sort_by(&:sales).reverse.take(5)
  
        {
          book: book,
          total_sales: total_sales,
          author_sales: author_sales,
          top_5_sales_year: top_5_sales_year
        }
      end
      .sort_by { |b| b[:total_sales] }
      .reverse
      .take(50)
  end
  def search
    # Aquí no es necesario hacer nada, solo se muestra el formulario
  end
  
  def search_result
     # Convertir el texto de búsqueda a minúsculas y dividirlo en palabras clave
  search_text = params[:search].downcase.split

  # Definir la cantidad de resultados por página
  per_page = 10
  page = params[:page].to_i > 0 ? params[:page].to_i : 1
  skip = (page - 1) * per_page

  # Buscar los libros que contengan alguna de las palabras clave en el resumen
  view = Book.by_summary
  @books = view.keys(search_text).limit(per_page).skip(skip)

  # Obtener el total de resultados para manejar la paginación
  total_books = view.keys(search_text).count

  # Calcular el número total de páginas
  @total_pages = (total_books / per_page.to_f).ceil
  @current_page = page
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :summary, :date_of_publication, :number_of_sales)
    end
end
