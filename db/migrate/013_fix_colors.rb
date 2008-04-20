class FixColors < ActiveRecord::Migration
  def self.up
    add_column :trucks, :ext_color_id, :integer
    add_column :trucks, :int_color_id, :integer
    
    @color = Color.new
    @color.name = "silver"
    @color.save
    @color = Color.new
    @color.name = "black"
    @color.save
    @color = Color.new
    @color.name = "green"
    @color.save
    @color = Color.new
    @color.name = "blue"
    @color.save
    @color = Color.new
    @color.name = "gray"
    @color.save
    @color = Color.new
    @color.name = "white"
    @color.save
    @color = Color.new
    @color.name = "red"
    @color.save
    @color = Color.new
    @color.name = "beige"
    @color.save
    @color = Color.new
    @color.name = "gold"
    @color.save
    @color = Color.new
    @color.name = "brown"
    @color.save    
    
  end

  def self.down
    remove_column :trucks, :ext_color_id
    remove_column :trucks, :int_color_id
    
    Color.delete_all
  end
end
