class CreateServiceLogTypes < ActiveRecord::Migration
  def self.up
    create_table :service_log_types do |t|
      t.string :name

      t.timestamps
    end
    
    ServiceLogType.create({:name => "Fluid Change"})
    ServiceLogType.create({:name => "Suspension Maintenance"})
    ServiceLogType.create({:name => "Transmission Maintenance"})
    ServiceLogType.create({:name => "Minor Maintenance"})
    ServiceLogType.create({:name => "Other Maintenance"})
    
  end

  def self.down
    drop_table :service_log_types
  end
end
