require 'test_helper'

class StopoversControllerTest < ActionController::TestCase
  setup do
    @stopover = stopovers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stopovers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stopover" do
    assert_difference('Stopover.count') do
      post :create, stopover: @stopover.attributes
    end

    assert_redirected_to stopover_path(assigns(:stopover))
  end

  test "should show stopover" do
    get :show, id: @stopover
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stopover
    assert_response :success
  end

  test "should update stopover" do
    put :update, id: @stopover, stopover: @stopover.attributes
    assert_redirected_to stopover_path(assigns(:stopover))
  end

  test "should destroy stopover" do
    assert_difference('Stopover.count', -1) do
      delete :destroy, id: @stopover
    end

    assert_redirected_to stopovers_path
  end
end
