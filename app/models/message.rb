class Message < ActiveRecord::Base
  belongs_to :user
  #validates_length_of :subject, :within => 0..255
  #validates_presence_of :user_id, :from_user_id
end
