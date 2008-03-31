class ServiceLogType < ActiveRecord::Base
    has_many :service_logs
    
    validates_presence_of :name
    validates_uniqueness_of :name
end
