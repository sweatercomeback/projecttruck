class Model < VehicleAttribute
    belongs_to :make, :foreign_key => :parent_id
    has_many :vehicles
end
