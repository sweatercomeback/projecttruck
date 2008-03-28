class CreateTruckAttributes < ActiveRecord::Migration
  def self.up
    create_table :truck_attributes do |t|
      t.string :type
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :truck_attributes
  end
end
