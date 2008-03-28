require File.dirname(__FILE__) + '/../test_helper'

class ServiceLogsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:service_logs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_service_log
    assert_difference('ServiceLog.count') do
      post :create, :service_log => { }
    end

    assert_redirected_to service_log_path(assigns(:service_log))
  end

  def test_should_show_service_log
    get :show, :id => service_logs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => service_logs(:one).id
    assert_response :success
  end

  def test_should_update_service_log
    put :update, :id => service_logs(:one).id, :service_log => { }
    assert_redirected_to service_log_path(assigns(:service_log))
  end

  def test_should_destroy_service_log
    assert_difference('ServiceLog.count', -1) do
      delete :destroy, :id => service_logs(:one).id
    end

    assert_redirected_to service_logs_path
  end
end
