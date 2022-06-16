require "test_helper"

class TempDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_datum = temp_data(:one)
  end

  test "should get index" do
    get temp_data_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_datum_url
    assert_response :success
  end

  test "should create temp_datum" do
    assert_difference('TempDatum.count') do
      post temp_data_url, params: { temp_datum: {  } }
    end

    assert_redirected_to temp_datum_url(TempDatum.last)
  end

  test "should show temp_datum" do
    get temp_datum_url(@temp_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_datum_url(@temp_datum)
    assert_response :success
  end

  test "should update temp_datum" do
    patch temp_datum_url(@temp_datum), params: { temp_datum: {  } }
    assert_redirected_to temp_datum_url(@temp_datum)
  end

  test "should destroy temp_datum" do
    assert_difference('TempDatum.count', -1) do
      delete temp_datum_url(@temp_datum)
    end

    assert_redirected_to temp_data_url
  end
end
