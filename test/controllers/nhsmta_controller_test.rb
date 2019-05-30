require 'test_helper'

class NhsmtaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nhsmta = nhsmta(:one)
  end

  test "should get index" do
    get nhsmta_index_url, as: :json
    assert_response :success
  end

  test "should create nhsmta" do
    assert_difference('Nhsmta.count') do
      post nhsmta_index_url, params: { nhsmta: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show nhsmta" do
    get nhsmta_url(@nhsmta), as: :json
    assert_response :success
  end

  test "should update nhsmta" do
    patch nhsmta_url(@nhsmta), params: { nhsmta: {  } }, as: :json
    assert_response 200
  end

  test "should destroy nhsmta" do
    assert_difference('Nhsmta.count', -1) do
      delete nhsmta_url(@nhsmta), as: :json
    end

    assert_response 204
  end
end
