class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.column :title, :string
      t.column :model_other, :string
      t.column :year, :integer
      t.column :mileage, :integer
      t.column :engine_comments, :text
      t.column :drive_comments, :text
      t.column :transmission_comments, :text
      t.column :doors, :integer
      t.column :ext_color_comments, :text
      t.column :int_color_comments, :text
      t.column :vehicle_condition_comments, :text
      t.column :street_legal, :boolean
      t.column :additional_comments, :text
      t.column :active, :boolean
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
      t.column :zipcode, :string
      t.column :city, :string
    end
  end

  def self.down
    drop_table :vehicles
  end
end
