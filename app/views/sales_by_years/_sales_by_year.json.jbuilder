json.extract! sales_by_year, :id, :book_id, :year, :sales, :created_at, :updated_at
json.url sales_by_year_url(sales_by_year, format: :json)
