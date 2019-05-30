require 'test_helper'

class TokmtaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tokmta = tokmta(:one)
  end

  test "should get index" do
    get tokmta_index_url, as: :json
    assert_response :success
  end

  test "should create tokmta" do
    assert_difference('Tokmta.count') do
      post tokmta_index_url, params: { tokmta: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show tokmta" do
    get tokmta_url(@tokmta), as: :json
    assert_response :success
  end

  test "should update tokmta" do
    patch tokmta_url(@tokmta), params: { tokmta: {  } }, as: :json
    assert_response 200
  end

  test "should destroy tokmta" do
    assert_difference('Tokmta.count', -1) do
      delete tokmta_url(@tokmta), as: :json
    end

    assert_response 204
  end
end
