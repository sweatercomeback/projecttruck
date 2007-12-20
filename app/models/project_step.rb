class ProjectStep < ActiveRecord::Base
  belongs_to :project_photo
  belongs_to :project
end
