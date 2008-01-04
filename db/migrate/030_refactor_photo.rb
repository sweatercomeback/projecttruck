class RefactorPhoto < ActiveRecord::Migration
  def self.up
    #create mapping tables for vehicles and photos
    
    create_table :photos_vehicles do |t|
      t.column "photo_id", :integer
      t.column "vehicle_id", :integer
    end
    
    create_table :photos_projects do |t|
      t.column "photo_id", :integer
      t.column "project_id", :integer
    end
    
    #drop old tables
    drop_table :project_photos
    drop_table :vehicle_photos
    
    rename_column "project_steps", "project_photo_id", "photo_id"
  end

  def self.down
    drop_table :photos_vehicles
    drop_table :photos_projects
    rename_column "project_steps", "photo_id", "project_photo_id"
  end
end
