require File.dirname(__FILE__) + '/../test_helper'
require 'service_log_controller'

# Re-raise errors caught by the controller.
class ServiceLogController; def rescue_action(e) raise e end; end

class ServiceLogControllerTest < Test::Unit::TestCase
  def setup
    @controller = ServiceLogController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
