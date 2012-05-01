require 'test_helper'

class CategoriesTasksControllerTest < ActionController::TestCase
  setup do
    @categories_task = categories_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categories_task" do
    assert_difference('CategoriesTask.count') do
      post :create, categories_task: @categories_task.attributes
    end

    assert_redirected_to categories_task_path(assigns(:categories_task))
  end

  test "should show categories_task" do
    get :show, id: @categories_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categories_task
    assert_response :success
  end

  test "should update categories_task" do
    put :update, id: @categories_task, categories_task: @categories_task.attributes
    assert_redirected_to categories_task_path(assigns(:categories_task))
  end

  test "should destroy categories_task" do
    assert_difference('CategoriesTask.count', -1) do
      delete :destroy, id: @categories_task
    end

    assert_redirected_to categories_tasks_path
  end
end
