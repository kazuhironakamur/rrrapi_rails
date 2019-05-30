require 'test_helper'

class HinjancdControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hinjancd = hinjancd(:one)
  end

  test "should get index" do
    get hinjancd_index_url, as: :json
    assert_response :success
  end

  test "should create hinjancd" do
    assert_difference('Hinjancd.count') do
      post hinjancd_index_url, params: { hinjancd: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hinjancd" do
    get hinjancd_url(@hinjancd), as: :json
    assert_response :success
  end

  test "should update hinjancd" do
    patch hinjancd_url(@hinjancd), params: { hinjancd: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hinjancd" do
    assert_difference('Hinjancd.count', -1) do
      delete hinjancd_url(@hinjancd), as: :json
    end

    assert_response 204
  end
end
