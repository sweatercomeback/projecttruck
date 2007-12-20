class AddLocToVehicle < ActiveRecord::Migration
  def self.up
      add_column :vehicles, :lat, :float, :limit => 25
      add_column :vehicles, :lng, :float, :limit => 25
  end

  def self.down
      remove_column :vehicles, :lat
      remove_column :vehicles, :lng
  end
end
