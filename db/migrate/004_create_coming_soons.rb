class CreateComingSoons < ActiveRecord::Migration
  def self.up
    create_table :coming_soons do |t|
      t.column :email, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :coming_soons
  end
end
