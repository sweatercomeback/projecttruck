class CreateProjectSteps < ActiveRecord::Migration
  def self.up
    create_table :project_steps do |t|
      t.column :project_id, :integer
      t.column :text, :string
      t.column :project_photo_id, :integer
    end
  end

  def self.down
    drop_table :project_steps
  end
end
