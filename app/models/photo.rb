class Photo < ActiveRecord::Base
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 1000.kilobytes,
                 :resize_to => '500>',
                 :thumbnails => { :thumb => '75' }

  validates_as_attachment  
end
