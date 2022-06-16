require "application_system_test_case"

class WeightDataTest < ApplicationSystemTestCase
  setup do
    @weight_datum = weight_data(:one)
  end

  test "visiting the index" do
    visit weight_data_url
    assert_selector "h1", text: "Weight Data"
  end

  test "creating a Weight datum" do
    visit weight_data_url
    click_on "New Weight Datum"

    click_on "Create Weight datum"

    assert_text "Weight datum was successfully created"
    click_on "Back"
  end

  test "updating a Weight datum" do
    visit weight_data_url
    click_on "Edit", match: :first

    click_on "Update Weight datum"

    assert_text "Weight datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Weight datum" do
    visit weight_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weight datum was successfully destroyed"
  end
end
