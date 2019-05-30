require 'test_helper'

class OdntraControllerTest < ActionDispatch::IntegrationTest
  setup do
    @odntra = odntra(:one)
  end

  test "should get index" do
    get odntra_index_url, as: :json
    assert_response :success
  end

  test "should create odntra" do
    assert_difference('Odntra.count') do
      post odntra_index_url, params: { odntra: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show odntra" do
    get odntra_url(@odntra), as: :json
    assert_response :success
  end

  test "should update odntra" do
    patch odntra_url(@odntra), params: { odntra: {  } }, as: :json
    assert_response 200
  end

  test "should destroy odntra" do
    assert_difference('Odntra.count', -1) do
      delete odntra_url(@odntra), as: :json
    end

    assert_response 204
  end
end
