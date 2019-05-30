require 'test_helper'

class KsnmtaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ksnmta = ksnmta(:one)
  end

  test "should get index" do
    get ksnmta_index_url, as: :json
    assert_response :success
  end

  test "should create ksnmta" do
    assert_difference('Ksnmta.count') do
      post ksnmta_index_url, params: { ksnmta: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show ksnmta" do
    get ksnmta_url(@ksnmta), as: :json
    assert_response :success
  end

  test "should update ksnmta" do
    patch ksnmta_url(@ksnmta), params: { ksnmta: {  } }, as: :json
    assert_response 200
  end

  test "should destroy ksnmta" do
    assert_difference('Ksnmta.count', -1) do
      delete ksnmta_url(@ksnmta), as: :json
    end

    assert_response 204
  end
end
