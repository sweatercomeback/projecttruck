class CreateVehicleAttributeData < ActiveRecord::Migration
  def self.up

    #Create make and models
    @make = Make.new
    @make.name = "Ford"
    @make.save
    @model = Model.new({ :name => "Bronco" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Bronco II" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Econoline" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Excursion" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Explorer" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Expedition" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "F-150" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "F-250" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "F-350" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Ranger" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Dodge"
    @make.save
    @model = Model.new({ :name => "D50 Pick Up" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Dakota" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Durango" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Power Wagon" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Ram 1500" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Ram 2500" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Ram 3500" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Ram SRT-10" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Ram Van" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Ramcharger" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "GMC"
    @make.save
    @model = Model.new({ :name => "Jimmy" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "S15 Pick Up" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Sierra C/K1500" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Sierra C/K2500" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Sierra C/K3500" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Yukon" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Typhoon" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Sonoma" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Chevrolet"
    @make.save
    @model = Model.new({ :name => "Avalanche" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Blazer" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Colarado" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "El Camino" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Express Van" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "S10 Blazer" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "10 Pick Up" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Silverado (C/K1500)" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Silverado (C/K2500)" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Silverado (C/K3500)" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Suburban" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Tahoe" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Trailblazer" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Datsun"
    @make.save
    @model = Model.new({ :name => "Pick Up" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Hummer"
    @make.save
    @model = Model.new({ :name => "H1" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "H2" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "H3" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Isuzu"
    @make.save
    @model = Model.new({ :name => "Pick Up" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Hombre" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Rodeo" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Trooper" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Trooper II" })
    @model.make = @make
    @model.save    

    @make = Make.new
    @make.name = "Land Rover"
    @make.save
    @model = Model.new({ :name => "Land Rover" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Range Rover" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Freelander" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Discovery" })
    @model.make = @make
    @model.save    

    @make = Make.new
    @make.name = "Mazda"
    @make.save

    @model = Model.new({ :name => "B-Series Pick Up" })
    @model.make = @make
    @model.save  

    @make = Make.new
    @make.name = "Nissan"
    @make.save
    @model = Model.new({ :name => "Frontier" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Murano" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Pathfinder" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Pick Up" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Titan" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Toyota"
    @make.save
    @model = Model.new({ :name => "4Runner" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Tacoma" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "T100" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "FJ Cruiser" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Sequoia" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "RAV4" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Pick Up" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "VW"
    @make.save
    @model = Model.new({ :name => "Touareg" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Suzuki"
    @make.save
    @model = Model.new({ :name => "Sidekick" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Samurai" })
    @model.make = @make
    @model.save
    
    @make = Make.new
    @make.name = "Mitsubishi"
    @make.save
    @model = Model.new({ :name => "Pick Up" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Mighty Max" })
    @model.make = @make
    @model.save

    @make = Make.new
    @make.name = "Jeep"
    @make.save
    @model = Model.new({ :name => "Comanche" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "CJ" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Wrangler" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Cherokee" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Grand Cherokee" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Wagoneer" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Grand Wagoneer" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Liberty" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Commander" })
    @model.make = @make
    @model.save
    @model = Model.new({ :name => "Pick Up" })
    @model.make = @make
    @model.save
    
    #Create Drives
    @drive = Drive.new
    @drive.name = "2WD"
    @drive.save
    @drive = Drive.new
    @drive.name = "4WD"
    @drive.save
    @drive = Drive.new
    @drive.name = "AWD"
    @drive.save
    
    #Create Engines
    @engine = Engine.new
    @engine.name = "4-Cylinder"
    @engine.save
    @engine = Engine.new
    @engine.name = "6-Cylinder"
    @engine.save
    @engine = Engine.new
    @engine.name = "8-Cylinder"
    @engine.save
    
    #Create Transmissions
    @transmission = Transmission.new
    @transmission.name = "Automatic"
    @transmission.save
    @transmission = Transmission.new
    @transmission.name = "3-Speed Manual"
    @transmission.save
    @transmission = Transmission.new
    @transmission.name = "4-Speed Manual"
    @transmission.save
    @transmission = Transmission.new
    @transmission.name = "5-Speed Manual"
    @transmission.save
    
    #Create VehicleConditions
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "emaculate"
    @vehicle_condition.save
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "awesome"
    @vehicle_condition.save
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "pretty good"
    @vehicle_condition.save
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "eh"
    @vehicle_condition.save
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "some rust"
    @vehicle_condition.save
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "looks nice, runs bad"
    @vehicle_condition.save
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "runs nice, looks bad"
    @vehicle_condition.save
    @vehicle_condition = VehicleCondition.new
    @vehicle_condition.name = "tow job"
    @vehicle_condition.save
    
  end

  def self.down
  end
end
