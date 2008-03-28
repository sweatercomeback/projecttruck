class Truck < ActiveRecord::Base
  belongs_to :user
  has_many :projects, :dependent => :destroy
  has_many :service_logs, :dependent => :destroy
  has_many :truck_photos, :dependent => :destroy
  has_many :photos, :through => :truck_photos, :dependent => :destroy
  belongs_to :engine
  belongs_to :drive
  belongs_to :transmission
  belongs_to :condition
  belongs_to :model, :include => :make
end
