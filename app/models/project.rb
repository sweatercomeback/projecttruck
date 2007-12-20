class Project < ActiveRecord::Base
  belongs_to :vehicle
  has_many :project_steps
  has_many :project_photos
end
