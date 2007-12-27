class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.column :title, :string
      t.column :summary, :string
      t.column :article, :text
      t.column :active, :boolean
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
    end
  end

  def self.down
    drop_table :news_items
  end
end
