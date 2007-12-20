require File.dirname(__FILE__) + '/../test_helper'
require 'coming_soon_controller'

# Re-raise errors caught by the controller.
class ComingSoonController; def rescue_action(e) raise e end; end

class ComingSoonControllerTest < Test::Unit::TestCase
  def setup
    @controller = ComingSoonController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
