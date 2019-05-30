require 'test_helper'

class ClsmtaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clsmta = clsmta(:one)
  end

  test "should get index" do
    get clsmta_index_url, as: :json
    assert_response :success
  end

  test "should create clsmta" do
    assert_difference('Clsmta.count') do
      post clsmta_index_url, params: { clsmta: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show clsmta" do
    get clsmta_url(@clsmta), as: :json
    assert_response :success
  end

  test "should update clsmta" do
    patch clsmta_url(@clsmta), params: { clsmta: {  } }, as: :json
    assert_response 200
  end

  test "should destroy clsmta" do
    assert_difference('Clsmta.count', -1) do
      delete clsmta_url(@clsmta), as: :json
    end

    assert_response 204
  end
end
