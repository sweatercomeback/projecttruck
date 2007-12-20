class LinkProjectPhotoToProject < ActiveRecord::Migration
  def self.up
      # links photo to project model
      add_column :project_photos, :project_id, :integer
  end

  def self.down
    remove_column :project_photos, :project_id
  end
end
