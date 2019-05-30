require 'test_helper'

class JdntraControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jdntra = jdntra(:one)
  end

  test "should get index" do
    get jdntra_index_url, as: :json
    assert_response :success
  end

  test "should create jdntra" do
    assert_difference('Jdntra.count') do
      post jdntra_index_url, params: { jdntra: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show jdntra" do
    get jdntra_url(@jdntra), as: :json
    assert_response :success
  end

  test "should update jdntra" do
    patch jdntra_url(@jdntra), params: { jdntra: {  } }, as: :json
    assert_response 200
  end

  test "should destroy jdntra" do
    assert_difference('Jdntra.count', -1) do
      delete jdntra_url(@jdntra), as: :json
    end

    assert_response 204
  end
end
