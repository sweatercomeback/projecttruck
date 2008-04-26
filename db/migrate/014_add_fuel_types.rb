class AddFuelTypes < ActiveRecord::Migration
  def self.up
    #create fuel
    @fuel = Fuel.new
    @fuel.name = "gasoline"
    @fuel.save
    @fuel = Fuel.new
    @fuel.name = "diesel"
    @fuel.save
    @fuel = Fuel.new
    @fuel.name = "alternative"
    @fuel.save 
  end

  def self.down
    Fuel.delete_all
  end
end
