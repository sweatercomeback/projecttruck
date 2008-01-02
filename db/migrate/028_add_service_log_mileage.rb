class AddServiceLogMileage < ActiveRecord::Migration
  def self.up
    add_column :service_logs, :mileage, :integer
  end

  def self.down
    add_column :service_logs, :mileage
  end
end
