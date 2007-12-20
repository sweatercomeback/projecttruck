class MakeUserMappable < ActiveRecord::Migration
  def self.up
      add_column :users, :lat, :float, :limit => 25
      add_column :users, :lng, :float, :limit => 25
  end

  def self.down
      remove_column :users, :lat
      remove_column :users, :lng
  end
end
