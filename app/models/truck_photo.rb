class TruckPhoto < ActiveRecord::Base
    belongs_to :truck
    belongs_to :photo
    
    validates_presence_of :truck_id
    validates_presence_of :photo_id
end
