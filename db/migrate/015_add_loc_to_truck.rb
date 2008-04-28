class AddLocToTruck < ActiveRecord::Migration
  def self.up
      add_column :trucks, :lat, :float, :limit => 25
      add_column :trucks, :lng, :float, :limit => 25
      add_column :trucks, :zip, :string
  end

  def self.down
      remove_column :trucks, :lat
      remove_column :trucks, :lng
      remove_column :trucks, :zip
  end
end
