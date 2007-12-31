class CreateNavLinks < ActiveRecord::Migration
  def self.up
    create_table :nav_links do |t|
      t.string :name, :null => false
      t.string :link_controller, :null => false
      t.string :link_action
      t.string :controller
      t.string :action
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def self.down
    drop_table :nav_links
  end
end
