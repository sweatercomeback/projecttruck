class CreateServiceLogs < ActiveRecord::Migration
  def self.up
    create_table :service_logs do |t|
      t.integer :service_log_type_id
      t.integer :truck_id
      t.string :comments, :limit => 4000
      t.integer :mileage

      t.timestamps
    end
  end

  def self.down
    drop_table :service_logs
  end
end
