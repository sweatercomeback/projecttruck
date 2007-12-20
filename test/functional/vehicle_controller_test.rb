require File.dirname(__FILE__) + '/../test_helper'
require 'vehicle_controller'

# Re-raise errors caught by the controller.
class VehicleController; def rescue_action(e) raise e end; end

class VehicleControllerTest < Test::Unit::TestCase
  def setup
    @controller = VehicleController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
