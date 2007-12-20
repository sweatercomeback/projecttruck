class CreateDrives < ActiveRecord::Migration
  def self.up
    create_table :drives do |t|
      t.column :name, :string
    end
    
    @drive = Drive.new
    @drive.name = "2WD"
    @drive.save
    @drive = Drive.new
    @drive.name = "4WD"
    @drive.save
    @drive = Drive.new
    @drive.name = "AWD"
    @drive.save
  end

  def self.down
    drop_table :drives
  end
end
