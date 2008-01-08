class Photo < ActiveRecord::Base
  acts_as_attachment :storage => :file_system, :resize_to => '500>', :thumbnails => { :thumb => '75' }
  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :projects
  belongs_to :users
  has_many :project_steps
  
  def self.find_by_userid(userid)
    return Photo.find(:all, :conditions => ['user_id = ?', userid])
  end
end
