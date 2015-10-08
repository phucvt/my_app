require 'test_helper'

class CateloriesControllerTest < ActionController::TestCase
  setup do
    @catelory = catelories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catelories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catelory" do
    assert_difference('Catelory.count') do
      post :create, catelory: { name: @catelory.name }
    end

    assert_redirected_to catelory_path(assigns(:catelory))
  end

  test "should show catelory" do
    get :show, id: @catelory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catelory
    assert_response :success
  end

  test "should update catelory" do
    patch :update, id: @catelory, catelory: { name: @catelory.name }
    assert_redirected_to catelory_path(assigns(:catelory))
  end

  test "should destroy catelory" do
    assert_difference('Catelory.count', -1) do
      delete :destroy, id: @catelory
    end

    assert_redirected_to catelories_path
  end
end
