require File.dirname(__FILE__) + '/../test_helper'
require 'project_step_controller'

# Re-raise errors caught by the controller.
class ProjectStepController; def rescue_action(e) raise e end; end

class ProjectStepControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProjectStepController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
