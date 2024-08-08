class SalesByYearsController < ApplicationController
  before_action :set_sales_by_year, only: %i[ show edit update destroy ]

  # GET /sales_by_years or /sales_by_years.json
  def index
    @sales_by_years = SalesByYear.all
    @books = Book.all
    @sales_with_books = @sales_by_years.map do |sales_by_year|
      {
        sales_by_year: sales_by_year,
        book_name: @books.select{|book| book.id == sales_by_year.book_id}.first.name
      }
    end
  end

  # GET /sales_by_years/1 or /sales_by_years/1.json
  def show
  end

  # GET /sales_by_years/new
  def new
    @sales_by_year = SalesByYear.new
  end

  # GET /sales_by_years/1/edit
  def edit
  end

  # POST /sales_by_years or /sales_by_years.json
  def create
    @sales_by_year = SalesByYear.new(sales_by_year_params)

    respond_to do |format|
      if @sales_by_year.save
        format.html { redirect_to sales_by_year_url(@sales_by_year), notice: "Sales by year was successfully created." }
        format.json { render :show, status: :created, location: @sales_by_year }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_by_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_by_years/1 or /sales_by_years/1.json
  def update
    respond_to do |format|
      if @sales_by_year.update(sales_by_year_params)
        format.html { redirect_to sales_by_year_url(@sales_by_year), notice: "Sales by year was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_by_year }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_by_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_by_years/1 or /sales_by_years/1.json
  def destroy
    @sales_by_year.destroy!

    respond_to do |format|
      format.html { redirect_to sales_by_years_url, notice: "Sales by year was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_by_year
      @sales_by_year = SalesByYear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_by_year_params
      params.require(:sales_by_year).permit(:book_id, :year, :sales)
    end
end
