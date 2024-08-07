require "application_system_test_case"

class SalesByYearsTest < ApplicationSystemTestCase
  setup do
    @sales_by_year = sales_by_years(:one)
  end

  test "visiting the index" do
    visit sales_by_years_url
    assert_selector "h1", text: "Sales by years"
  end

  test "should create sales by year" do
    visit sales_by_years_url
    click_on "New sales by year"

    fill_in "Book", with: @sales_by_year.book_id
    fill_in "Sales", with: @sales_by_year.sales
    fill_in "Year", with: @sales_by_year.year
    click_on "Create Sales by year"

    assert_text "Sales by year was successfully created"
    click_on "Back"
  end

  test "should update Sales by year" do
    visit sales_by_year_url(@sales_by_year)
    click_on "Edit this sales by year", match: :first

    fill_in "Book", with: @sales_by_year.book_id
    fill_in "Sales", with: @sales_by_year.sales
    fill_in "Year", with: @sales_by_year.year
    click_on "Update Sales by year"

    assert_text "Sales by year was successfully updated"
    click_on "Back"
  end

  test "should destroy Sales by year" do
    visit sales_by_year_url(@sales_by_year)
    click_on "Destroy this sales by year", match: :first

    assert_text "Sales by year was successfully destroyed"
  end
end
