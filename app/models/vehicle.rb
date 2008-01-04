class Vehicle < ActiveRecord::Base
    belongs_to :model
    belongs_to :engine
    belongs_to :drive
    belongs_to :transmission
    belongs_to :vehicle_condition
    belongs_to :user
    has_many :service_logs
    has_and_belongs_to_many :photos
    has_many :projects
    acts_as_mappable
end
