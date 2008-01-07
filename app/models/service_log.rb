class ServiceLog < ActiveRecord::Base
  belongs_to :service_log_type
  belongs_to :vehicle
  
  def self.find_top_by_user_id(user_id, limit)
    return ServiceLog.find_by_sql(['select service_logs.* from service_logs inner join vehicles on vehicles.id = service_logs.vehicle_id and vehicles.user_id = ? limit ?', user_id, limit])
  end
  
end
