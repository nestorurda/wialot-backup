require "application_system_test_case"

class WeightDevicesTest < ApplicationSystemTestCase
  setup do
    @weight_device = weight_devices(:one)
  end

  test "visiting the index" do
    visit weight_devices_url
    assert_selector "h1", text: "Weight Devices"
  end

  test "creating a Weight device" do
    visit weight_devices_url
    click_on "New Weight Device"

    click_on "Create Weight device"

    assert_text "Weight device was successfully created"
    click_on "Back"
  end

  test "updating a Weight device" do
    visit weight_devices_url
    click_on "Edit", match: :first

    click_on "Update Weight device"

    assert_text "Weight device was successfully updated"
    click_on "Back"
  end

  test "destroying a Weight device" do
    visit weight_devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weight device was successfully destroyed"
  end
end
