class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.integer :truck_id
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
