class Message < ActiveRecord::Base
  belongs_to :user
  validates_length_of :subject, :within => 0..255
  validates_presence_of :user_id, :from_user_id
  
  def self.find_unread(user_id)
    return Message.find(:all, :conditions =>{:unread => 1, :user_id => user_id})
  end
end
