class AddUserToVehicle < ActiveRecord::Migration
  def self.up
      add_column :vehicles, :user_id, :integer
  end

  def self.down
      remove_column :vehicles, :user_id, :integer
  end
end
