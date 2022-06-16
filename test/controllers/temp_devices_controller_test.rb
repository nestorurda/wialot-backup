require "test_helper"

class TempDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_device = temp_devices(:one)
  end

  test "should get index" do
    get temp_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_device_url
    assert_response :success
  end

  test "should create temp_device" do
    assert_difference('TempDevice.count') do
      post temp_devices_url, params: { temp_device: {  } }
    end

    assert_redirected_to temp_device_url(TempDevice.last)
  end

  test "should show temp_device" do
    get temp_device_url(@temp_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_device_url(@temp_device)
    assert_response :success
  end

  test "should update temp_device" do
    patch temp_device_url(@temp_device), params: { temp_device: {  } }
    assert_redirected_to temp_device_url(@temp_device)
  end

  test "should destroy temp_device" do
    assert_difference('TempDevice.count', -1) do
      delete temp_device_url(@temp_device)
    end

    assert_redirected_to temp_devices_url
  end
end
