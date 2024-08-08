class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

  # GET /authors or /authors.json
  def index
      # Construimos la lista de autores con información adicional
      authors_data = Author.all.map do |author|
        # Obtenemos todos los libros del autor actual
        books = Book.by_author_id(key: author.id)
        
        # Contamos el número de libros
        num_books = books.count()
        
        # Calculamos las ventas totales sumando las ventas de cada libro
        total_sales = SalesByYear.by_book_id(keys: books.map(&:id)).map(&:sales).sum
        
        # Calculamos la puntuación promedio de las reseñas
        reviews = Review.by_book_id(keys: books.map(&:id))
        average_score = (reviews.map(&:score).sum / reviews.length.to_f).round(3) if reviews.present?
        
        # Retornamos un hash con la información del autor
        {
          author: author,
          num_books: num_books,
          total_sales: total_sales,
          average_score: average_score || 0
        }
      end
      
      # Opcional: ordenar y filtrar según los parámetros
      if params[:sort_by]
        @sorted_authors = authors_data.sort_by { |author_data| author_data[params[:sort_by].to_sym] }
        @sorted_authors.reverse! if params[:direction] == "desc"
      else
        @sorted_authors = authors_data
      end
  end

  def crud
      # Construimos la lista de autores con información adicional
      @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
    @author = Author.find(params[:id])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to author_url(@author), notice: "Author was successfully created." }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_url(@author), notice: "Author was successfully updated." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    Author.get(@author.id).destroy

    respond_to do |format|
      format.html { redirect_to crud_authors_url, notice: "Author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:name, :date_of_birth, :country_of_origin, :short_description)
    end
end
