require "application_system_test_case"

class TempDataTest < ApplicationSystemTestCase
  setup do
    @temp_datum = temp_data(:one)
  end

  test "visiting the index" do
    visit temp_data_url
    assert_selector "h1", text: "Temp Data"
  end

  test "creating a Temp datum" do
    visit temp_data_url
    click_on "New Temp Datum"

    click_on "Create Temp datum"

    assert_text "Temp datum was successfully created"
    click_on "Back"
  end

  test "updating a Temp datum" do
    visit temp_data_url
    click_on "Edit", match: :first

    click_on "Update Temp datum"

    assert_text "Temp datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Temp datum" do
    visit temp_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Temp datum was successfully destroyed"
  end
end
