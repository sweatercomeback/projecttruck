class Model < TruckAttribute
  belongs_to :make, :foreign_key => :parent_id
end