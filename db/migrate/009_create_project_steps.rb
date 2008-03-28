class CreateProjectSteps < ActiveRecord::Migration
  def self.up
    create_table :project_steps do |t|
      t.integer :project_id
      t.text :details
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_steps
  end
end
