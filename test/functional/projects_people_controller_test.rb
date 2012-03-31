require 'test_helper'

class ProjectsPeopleControllerTest < ActionController::TestCase
  setup do
    @projects_person = projects_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projects_person" do
    assert_difference('ProjectsPerson.count') do
      post :create, projects_person: @projects_person.attributes
    end

    assert_redirected_to projects_person_path(assigns(:projects_person))
  end

  test "should show projects_person" do
    get :show, id: @projects_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projects_person
    assert_response :success
  end

  test "should update projects_person" do
    put :update, id: @projects_person, projects_person: @projects_person.attributes
    assert_redirected_to projects_person_path(assigns(:projects_person))
  end

  test "should destroy projects_person" do
    assert_difference('ProjectsPerson.count', -1) do
      delete :destroy, id: @projects_person
    end

    assert_redirected_to projects_people_path
  end
end
