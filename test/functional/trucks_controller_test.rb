require File.dirname(__FILE__) + '/../test_helper'

class TrucksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:trucks)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_truck
    assert_difference('Truck.count') do
      post :create, :truck => { }
    end

    assert_redirected_to truck_path(assigns(:truck))
  end

  def test_should_show_truck
    get :show, :id => trucks(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => trucks(:one).id
    assert_response :success
  end

  def test_should_update_truck
    put :update, :id => trucks(:one).id, :truck => { }
    assert_redirected_to truck_path(assigns(:truck))
  end

  def test_should_destroy_truck
    assert_difference('Truck.count', -1) do
      delete :destroy, :id => trucks(:one).id
    end

    assert_redirected_to trucks_path
  end
end
