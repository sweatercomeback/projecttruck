class TruckAttribute < ActiveRecord::Base
    validates_presence_of :value
end
