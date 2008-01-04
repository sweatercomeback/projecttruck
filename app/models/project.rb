class Project < ActiveRecord::Base
  belongs_to :vehicle
  has_many :project_steps
  has_and_belongs_to_many :photos
end
