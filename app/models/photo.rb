class Photo < ActiveRecord::Base
  acts_as_attachment :storage => :file_system
  validates_as_attachment
end
