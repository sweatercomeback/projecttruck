class AddUserActivity < ActiveRecord::Migration
  def self.up
      add_column :users, :last_activity_date, :timestamp
  end

  def self.down
      remove_column :users, :last_activity_date
  end
end
