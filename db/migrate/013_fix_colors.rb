class FixColors < ActiveRecord::Migration
  def self.up
    add_column :trucks, :ext_color_id, :integer
    add_column :trucks, :int_color_id, :integer
  end

  def self.down
    remove_column :trucks, :ext_color_id
    remove_column :trucks, :int_color_id
  end
end
