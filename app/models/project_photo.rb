class ProjectPhoto < ActiveRecord::Base
  acts_as_attachment :storage => :file_system
  has_many :projects
  has_many :project_steps
  belongs_to :project
end
