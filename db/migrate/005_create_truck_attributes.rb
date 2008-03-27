class CreateTruckAttributes < ActiveRecord::Migration
  def self.up
    create_table :truck_attributes do |t|
      t.integer :type_id
      t.string :value
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :truck_attributes
  end
end
