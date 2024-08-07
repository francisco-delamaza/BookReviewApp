require "test_helper"

class SalesByYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_by_year = sales_by_years(:one)
  end

  test "should get index" do
    get sales_by_years_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_by_year_url
    assert_response :success
  end

  test "should create sales_by_year" do
    assert_difference("SalesByYear.count") do
      post sales_by_years_url, params: { sales_by_year: { book_id: @sales_by_year.book_id, sales: @sales_by_year.sales, year: @sales_by_year.year } }
    end

    assert_redirected_to sales_by_year_url(SalesByYear.last)
  end

  test "should show sales_by_year" do
    get sales_by_year_url(@sales_by_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_by_year_url(@sales_by_year)
    assert_response :success
  end

  test "should update sales_by_year" do
    patch sales_by_year_url(@sales_by_year), params: { sales_by_year: { book_id: @sales_by_year.book_id, sales: @sales_by_year.sales, year: @sales_by_year.year } }
    assert_redirected_to sales_by_year_url(@sales_by_year)
  end

  test "should destroy sales_by_year" do
    assert_difference("SalesByYear.count", -1) do
      delete sales_by_year_url(@sales_by_year)
    end

    assert_redirected_to sales_by_years_url
  end
end
