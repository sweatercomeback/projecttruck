class AddVehicleAttributes < ActiveRecord::Migration
  def self.up
      add_column :vehicles, :engine_id, :integer
      add_column :vehicles, :drive_id, :integer
      add_column :vehicles, :transmission_id, :integer
      add_column :vehicles, :vehicle_condition_id, :integer
  end

  def self.down
      remove_column :vehicles, :engine_id, :integer
      remove_column :vehicles, :drive_id, :integer
      remove_column :vehicles, :transmission_id, :integer
      remove_column :vehicles, :vehicle_condition_id, :integer
  end
end
