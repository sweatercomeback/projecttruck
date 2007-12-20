class CreateMakes < ActiveRecord::Migration
  def self.up
    create_table :makes do |t|
        t.column :name, :string
    end
    
    @make = Make.new
    @make.name = "Ford"
    @make.save
    @make = Make.new
    @make.name = "Dodge"
    @make.save
    @make = Make.new
    @make.name = "GMC"
    @make.save
    @make = Make.new
    @make.name = "Chevrolet"
    @make.save
    @make = Make.new
    @make.name = "Datsun"
    @make.save
    @make = Make.new
    @make.name = "Hummer"
    @make.save
    @make = Make.new
    @make.name = "Isuzu"
    @make.save
    @make = Make.new
    @make.name = "Land Rover"
    @make.save
    @make = Make.new
    @make.name = "Mazda"
    @make.save
    @make = Make.new
    @make.name = "Nissan"
    @make.save
    @make = Make.new
    @make.name = "Toyota"
    @make.save
    @make = Make.new
    @make.name = "VW"
    @make.save
    @make = Make.new
    @make.name = "Suzuki"
    @make.save
    @make = Make.new
    @make.name = "Mitsubishi"
    @make.save
    @make = Make.new
    @make.name = "Jeep"
    @make.save
  end

  def self.down
    drop_table :makes
  end
end