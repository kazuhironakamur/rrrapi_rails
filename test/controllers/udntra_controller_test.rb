require 'test_helper'

class UdntraControllerTest < ActionDispatch::IntegrationTest
  setup do
    @udntra = udntra(:one)
  end

  test "should get index" do
    get udntra_index_url, as: :json
    assert_response :success
  end

  test "should create udntra" do
    assert_difference('Udntra.count') do
      post udntra_index_url, params: { udntra: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show udntra" do
    get udntra_url(@udntra), as: :json
    assert_response :success
  end

  test "should update udntra" do
    patch udntra_url(@udntra), params: { udntra: {  } }, as: :json
    assert_response 200
  end

  test "should destroy udntra" do
    assert_difference('Udntra.count', -1) do
      delete udntra_url(@udntra), as: :json
    end

    assert_response 204
  end
end
