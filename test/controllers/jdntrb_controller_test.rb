require 'test_helper'

class JdntrbControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jdntrb = jdntrb(:one)
  end

  test "should get index" do
    get jdntrb_index_url, as: :json
    assert_response :success
  end

  test "should create jdntrb" do
    assert_difference('Jdntrb.count') do
      post jdntrb_index_url, params: { jdntrb: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show jdntrb" do
    get jdntrb_url(@jdntrb), as: :json
    assert_response :success
  end

  test "should update jdntrb" do
    patch jdntrb_url(@jdntrb), params: { jdntrb: {  } }, as: :json
    assert_response 200
  end

  test "should destroy jdntrb" do
    assert_difference('Jdntrb.count', -1) do
      delete jdntrb_url(@jdntrb), as: :json
    end

    assert_response 204
  end
end
