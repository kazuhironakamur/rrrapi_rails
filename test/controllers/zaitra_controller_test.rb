require 'test_helper'

class ZaitraControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zaitra = zaitra(:one)
  end

  test "should get index" do
    get zaitra_index_url, as: :json
    assert_response :success
  end

  test "should create zaitra" do
    assert_difference('Zaitra.count') do
      post zaitra_index_url, params: { zaitra: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show zaitra" do
    get zaitra_url(@zaitra), as: :json
    assert_response :success
  end

  test "should update zaitra" do
    patch zaitra_url(@zaitra), params: { zaitra: {  } }, as: :json
    assert_response 200
  end

  test "should destroy zaitra" do
    assert_difference('Zaitra.count', -1) do
      delete zaitra_url(@zaitra), as: :json
    end

    assert_response 204
  end
end
