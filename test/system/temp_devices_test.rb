require "application_system_test_case"

class TempDevicesTest < ApplicationSystemTestCase
  setup do
    @temp_device = temp_devices(:one)
  end

  test "visiting the index" do
    visit temp_devices_url
    assert_selector "h1", text: "Temp Devices"
  end

  test "creating a Temp device" do
    visit temp_devices_url
    click_on "New Temp Device"

    click_on "Create Temp device"

    assert_text "Temp device was successfully created"
    click_on "Back"
  end

  test "updating a Temp device" do
    visit temp_devices_url
    click_on "Edit", match: :first

    click_on "Update Temp device"

    assert_text "Temp device was successfully updated"
    click_on "Back"
  end

  test "destroying a Temp device" do
    visit temp_devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Temp device was successfully destroyed"
  end
end
