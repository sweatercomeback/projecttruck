# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require_dependency "basic_auth"

class ApplicationController < ActionController::Base
  include BasicAuth
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_pt_session_id'

end
