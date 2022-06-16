require "test_helper"

class WeightDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weight_device = weight_devices(:one)
  end

  test "should get index" do
    get weight_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_weight_device_url
    assert_response :success
  end

  test "should create weight_device" do
    assert_difference('WeightDevice.count') do
      post weight_devices_url, params: { weight_device: {  } }
    end

    assert_redirected_to weight_device_url(WeightDevice.last)
  end

  test "should show weight_device" do
    get weight_device_url(@weight_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_weight_device_url(@weight_device)
    assert_response :success
  end

  test "should update weight_device" do
    patch weight_device_url(@weight_device), params: { weight_device: {  } }
    assert_redirected_to weight_device_url(@weight_device)
  end

  test "should destroy weight_device" do
    assert_difference('WeightDevice.count', -1) do
      delete weight_device_url(@weight_device)
    end

    assert_redirected_to weight_devices_url
  end
end
