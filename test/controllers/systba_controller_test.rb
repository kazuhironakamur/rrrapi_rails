require 'test_helper'

class SystbaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @systba = systba(:one)
  end

  test "should get index" do
    get systba_index_url, as: :json
    assert_response :success
  end

  test "should create systba" do
    assert_difference('Systba.count') do
      post systba_index_url, params: { systba: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show systba" do
    get systba_url(@systba), as: :json
    assert_response :success
  end

  test "should update systba" do
    patch systba_url(@systba), params: { systba: {  } }, as: :json
    assert_response 200
  end

  test "should destroy systba" do
    assert_difference('Systba.count', -1) do
      delete systba_url(@systba), as: :json
    end

    assert_response 204
  end
end
