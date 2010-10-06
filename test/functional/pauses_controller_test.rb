require 'test_helper'

class PausesControllerTest < ActionController::TestCase
  setup do
    @pause = pauses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pauses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pause" do
    assert_difference('Pause.count') do
      post :create, :pause => @pause.attributes
    end

    assert_redirected_to pause_path(assigns(:pause))
  end

  test "should show pause" do
    get :show, :id => @pause.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pause.to_param
    assert_response :success
  end

  test "should update pause" do
    put :update, :id => @pause.to_param, :pause => @pause.attributes
    assert_redirected_to pause_path(assigns(:pause))
  end

  test "should destroy pause" do
    assert_difference('Pause.count', -1) do
      delete :destroy, :id => @pause.to_param
    end

    assert_redirected_to pauses_path
  end
end
