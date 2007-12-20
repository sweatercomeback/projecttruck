class AddModelToVehicle < ActiveRecord::Migration
  def self.up
      add_column :vehicles, :model_id, :integer
  end

  def self.down
      remove_column :vehicles, :model_id
  end
end
