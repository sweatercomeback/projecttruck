class UpdateNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, 'user_id', :integer
    add_column :news_items, 'news_type_id', :integer
    add_column :news_items, 'public', :boolean
  end

  def self.down
    remove_column :news_items, 'user_id'
    remove_column :news_items, 'news_type_id'
    remove_column :news_items, 'public'
  end
end