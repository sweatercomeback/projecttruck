class CreateVehicleAttributes < ActiveRecord::Migration
  def self.up
    create_table :vehicle_attributes do |t|
      t.string :name
      t.string :type
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_attributes
  end
end
