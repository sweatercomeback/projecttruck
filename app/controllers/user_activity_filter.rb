class UserActivityFilter
  
  def self.filter(controller)
    User.find(session[:user_id]).update_attribute(:last_activity_date, Time.now)    
  end
  
end
