require 'test_helper'

class SwiftApiKeysControllerTest < ActionController::TestCase
  setup do
    @swift_api_key = swift_api_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swift_api_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swift_api_key" do
    assert_difference('SwiftApiKey.count') do
      post :create, swift_api_key: { key: @swift_api_key.key }
    end

    assert_redirected_to swift_api_key_path(assigns(:swift_api_key))
  end

  test "should show swift_api_key" do
    get :show, id: @swift_api_key
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swift_api_key
    assert_response :success
  end

  test "should update swift_api_key" do
    patch :update, id: @swift_api_key, swift_api_key: { key: @swift_api_key.key }
    assert_redirected_to swift_api_key_path(assigns(:swift_api_key))
  end

  test "should destroy swift_api_key" do
    assert_difference('SwiftApiKey.count', -1) do
      delete :destroy, id: @swift_api_key
    end

    assert_redirected_to swift_api_keys_path
  end
end
