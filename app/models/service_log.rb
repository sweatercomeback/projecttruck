class ServiceLog < ActiveRecord::Base
  belongs_to :service_log_type
  belongs_to :vehicle
end
