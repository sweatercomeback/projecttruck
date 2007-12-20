class CreateVehicleConditions < ActiveRecord::Migration
  def self.up
    create_table :vehicle_conditions do |t|
      t.column :name, :string
    end
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
    drop_table :vehicle_conditions
  end
end