class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.column :title, :string
      t.column :vehicle_id, :integer
      t.column :project_photo_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :projects
  end
end
