require 'test_helper'

class ZaismaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zaisma = zaisma(:one)
  end

  test "should get index" do
    get zaisma_index_url, as: :json
    assert_response :success
  end

  test "should create zaisma" do
    assert_difference('Zaisma.count') do
      post zaisma_index_url, params: { zaisma: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show zaisma" do
    get zaisma_url(@zaisma), as: :json
    assert_response :success
  end

  test "should update zaisma" do
    patch zaisma_url(@zaisma), params: { zaisma: {  } }, as: :json
    assert_response 200
  end

  test "should destroy zaisma" do
    assert_difference('Zaisma.count', -1) do
      delete zaisma_url(@zaisma), as: :json
    end

    assert_response 204
  end
end
