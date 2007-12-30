# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require_dependency "basic_auth"

class ApplicationController < ActionController::Base
  include BasicAuth
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_pt_session_id'
  
  def update_user_activity
    if session[:user_id] != nil && session[:user_id] != -1
      User.find(session[:user_id]).update_attribute(:last_activity_date, Time.now)
    end
  end

end
