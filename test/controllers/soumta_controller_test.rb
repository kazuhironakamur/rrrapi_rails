require 'test_helper'

class SoumtaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soumta = soumta(:one)
  end

  test "should get index" do
    get soumta_index_url, as: :json
    assert_response :success
  end

  test "should create soumta" do
    assert_difference('Soumta.count') do
      post soumta_index_url, params: { soumta: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show soumta" do
    get soumta_url(@soumta), as: :json
    assert_response :success
  end

  test "should update soumta" do
    patch soumta_url(@soumta), params: { soumta: {  } }, as: :json
    assert_response 200
  end

  test "should destroy soumta" do
    assert_difference('Soumta.count', -1) do
      delete soumta_url(@soumta), as: :json
    end

    assert_response 204
  end
end
