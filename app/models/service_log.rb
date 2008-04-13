class ServiceLog < ActiveRecord::Base
    belongs_to :truck
    belongs_to :service_log_type
    
    validates_presence_of :service_log_type_id
    validates_numericality_of :mileage
  
    def mileage=(miles)
      write_attribute(:mileage, miles.to_s.gsub(/[^0-9]/,""))
    end
      
    def self.find_by_user_id(user_id)
      ServiceLog.find(:all, :include => "truck", :conditions => "trucks.user_id = #{user_id}")
    end

    def self.find_by_user_id_and_id(user_id, id)
      ServiceLog.find(:first, :include => "truck", :conditions => "trucks.user_id = #{user_id} and service_logs.id = #{id}")
    end
    
    def self.find_all_by_truck_id(truck_id)
      ServiceLog.find(:all, :conditions => "truck_id = #{truck_id}")
    end    
end
