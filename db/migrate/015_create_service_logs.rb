class CreateServiceLogs < ActiveRecord::Migration
  def self.up
    create_table :service_logs do |t|
      t.column :service_log_type_id, :integer
      t.column :vehicle_id, :integer
      t.column :comments, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :service_logs
  end
end
