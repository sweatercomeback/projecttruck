class AddPrice < ActiveRecord::Migration
  def self.up
      add_column :vehicles, :price, :float
      add_column :vehicles, :for_sale, :boolean
  end

  def self.down
  end
end
