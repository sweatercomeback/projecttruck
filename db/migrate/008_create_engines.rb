class CreateEngines < ActiveRecord::Migration
  def self.up
    create_table :engines do |t|
      t.column :name, :string
    end
    
    @engine = Engine.new
    @engine.name = "4-Cylinder"
    @engine.save
    @engine = Engine.new
    @engine.name = "6-Cylinder"
    @engine.save
    @engine = Engine.new
    @engine.name = "8-Cylinder"
    @engine.save
  end

  def self.down
    drop_table :engines
  end
end
