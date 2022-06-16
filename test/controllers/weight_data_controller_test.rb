require "test_helper"

class WeightDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weight_datum = weight_data(:one)
  end

  test "should get index" do
    get weight_data_url
    assert_response :success
  end

  test "should get new" do
    get new_weight_datum_url
    assert_response :success
  end

  test "should create weight_datum" do
    assert_difference('WeightDatum.count') do
      post weight_data_url, params: { weight_datum: {  } }
    end

    assert_redirected_to weight_datum_url(WeightDatum.last)
  end

  test "should show weight_datum" do
    get weight_datum_url(@weight_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_weight_datum_url(@weight_datum)
    assert_response :success
  end

  test "should update weight_datum" do
    patch weight_datum_url(@weight_datum), params: { weight_datum: {  } }
    assert_redirected_to weight_datum_url(@weight_datum)
  end

  test "should destroy weight_datum" do
    assert_difference('WeightDatum.count', -1) do
      delete weight_datum_url(@weight_datum)
    end

    assert_redirected_to weight_data_url
  end
end
