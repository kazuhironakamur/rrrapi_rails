require 'test_helper'

class HinmtaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hinmta = hinmta(:one)
  end

  test "should get index" do
    get hinmta_index_url, as: :json
    assert_response :success
  end

  test "should create hinmta" do
    assert_difference('Hinmta.count') do
      post hinmta_index_url, params: { hinmta: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hinmta" do
    get hinmta_url(@hinmta), as: :json
    assert_response :success
  end

  test "should update hinmta" do
    patch hinmta_url(@hinmta), params: { hinmta: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hinmta" do
    assert_difference('Hinmta.count', -1) do
      delete hinmta_url(@hinmta), as: :json
    end

    assert_response 204
  end
end
