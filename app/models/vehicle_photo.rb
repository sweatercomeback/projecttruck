class VehiclePhoto < ActiveRecord::Base
  acts_as_attachment :storage => :file_system
  validates_as_attachment
  belongs_to :vehicle
end
