class Make < TruckAttribute
  has_many :models, :foreign_key => :parent_id
end