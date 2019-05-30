require 'test_helper'

class HsttraControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hsttra = hsttra(:one)
  end

  test "should get index" do
    get hsttra_index_url, as: :json
    assert_response :success
  end

  test "should create hsttra" do
    assert_difference('Hsttra.count') do
      post hsttra_index_url, params: { hsttra: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hsttra" do
    get hsttra_url(@hsttra), as: :json
    assert_response :success
  end

  test "should update hsttra" do
    patch hsttra_url(@hsttra), params: { hsttra: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hsttra" do
    assert_difference('Hsttra.count', -1) do
      delete hsttra_url(@hsttra), as: :json
    end

    assert_response 204
  end
end
