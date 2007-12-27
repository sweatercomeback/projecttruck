class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.column :subject, :string
      t.column :body, :text
      t.column :user_id, :integer
      t.column :from_user_id, :integer
      t.column :unread, :boolean
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
    end
  end

  def self.down
    drop_table :messages
  end
end
