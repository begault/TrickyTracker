require 'test_helper'

class TasksPeopleControllerTest < ActionController::TestCase
  setup do
    @tasks_person = tasks_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tasks_person" do
    assert_difference('TasksPerson.count') do
      post :create, tasks_person: @tasks_person.attributes
    end

    assert_redirected_to tasks_person_path(assigns(:tasks_person))
  end

  test "should show tasks_person" do
    get :show, id: @tasks_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tasks_person
    assert_response :success
  end

  test "should update tasks_person" do
    put :update, id: @tasks_person, tasks_person: @tasks_person.attributes
    assert_redirected_to tasks_person_path(assigns(:tasks_person))
  end

  test "should destroy tasks_person" do
    assert_difference('TasksPerson.count', -1) do
      delete :destroy, id: @tasks_person
    end

    assert_redirected_to tasks_people_path
  end
end
