class ServiceLog < ActiveRecord::Base
    belongs_to :truck
    belongs_to :service_log_type
end
