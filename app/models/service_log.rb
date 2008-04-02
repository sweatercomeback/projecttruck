class ServiceLog < ActiveRecord::Base
    belongs_to :truck
    belongs_to :service_log_type
    
    def self.find_by_user_id(user_id)
      ServiceLog.find(:all, :include => "truck", :conditions => "trucks.user_id = #{user_id}")
    end

    def self.find_by_user_id_and_id(user_id, id)
      ServiceLog.find(:first, :include => "truck", :conditions => "trucks.user_id = #{user_id} and service_logs.id = #{id}")
    end      
end
