class ProjectStep < ActiveRecord::Base
  belongs_to :photo
  belongs_to :project
end
