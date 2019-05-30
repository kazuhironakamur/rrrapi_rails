require 'test_helper'

class IdntraControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idntra = idntra(:one)
  end

  test "should get index" do
    get idntra_index_url, as: :json
    assert_response :success
  end

  test "should create idntra" do
    assert_difference('Idntra.count') do
      post idntra_index_url, params: { idntra: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show idntra" do
    get idntra_url(@idntra), as: :json
    assert_response :success
  end

  test "should update idntra" do
    patch idntra_url(@idntra), params: { idntra: {  } }, as: :json
    assert_response 200
  end

  test "should destroy idntra" do
    assert_difference('Idntra.count', -1) do
      delete idntra_url(@idntra), as: :json
    end

    assert_response 204
  end
end
