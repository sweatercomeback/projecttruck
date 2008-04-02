class CreateTrucks < ActiveRecord::Migration
  def self.up
    create_table :trucks do |t|
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
      t.column :public, :boolean, :default => false
      t.column :price, :float
      t.column :for_sale, :boolean, :default => false      
      t.column :engine_id, :integer
      t.column :drive_id, :integer
      t.column :transmission_id, :integer
      t.column :condition_id, :integer
      t.column :model_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :trucks
  end
end
