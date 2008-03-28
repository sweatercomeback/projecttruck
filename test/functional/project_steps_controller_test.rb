require File.dirname(__FILE__) + '/../test_helper'

class ProjectStepsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:project_steps)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_project_step
    assert_difference('ProjectStep.count') do
      post :create, :project_step => { }
    end

    assert_redirected_to project_step_path(assigns(:project_step))
  end

  def test_should_show_project_step
    get :show, :id => project_steps(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => project_steps(:one).id
    assert_response :success
  end

  def test_should_update_project_step
    put :update, :id => project_steps(:one).id, :project_step => { }
    assert_redirected_to project_step_path(assigns(:project_step))
  end

  def test_should_destroy_project_step
    assert_difference('ProjectStep.count', -1) do
      delete :destroy, :id => project_steps(:one).id
    end

    assert_redirected_to project_steps_path
  end
end
