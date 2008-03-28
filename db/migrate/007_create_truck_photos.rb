class CreateTruckPhotos < ActiveRecord::Migration
  def self.up
    create_table :truck_photos do |t|
      t.integer :truck_id
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :truck_photos
  end
end
