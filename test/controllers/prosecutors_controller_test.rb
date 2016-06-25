require 'test_helper'

class ProsecutorsControllerTest < ActionController::TestCase
  setup do
    @prosecutor = prosecutors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prosecutors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prosecutor" do
    assert_difference('Prosecutor.count') do
      post :create, prosecutor: { name: @prosecutor.name }
    end

    assert_redirected_to prosecutor_path(assigns(:prosecutor))
  end

  test "should show prosecutor" do
    get :show, id: @prosecutor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prosecutor
    assert_response :success
  end

  test "should update prosecutor" do
    patch :update, id: @prosecutor, prosecutor: { name: @prosecutor.name }
    assert_redirected_to prosecutor_path(assigns(:prosecutor))
  end

  test "should destroy prosecutor" do
    assert_difference('Prosecutor.count', -1) do
      delete :destroy, id: @prosecutor
    end

    assert_redirected_to prosecutors_path
  end
end
