class Project < ActiveRecord::Base
  belongs_to :vehicle
  has_many :project_steps
  has_and_belongs_to_many :photos
  
  def self.find_top_by_user_id(user_id, limit)
    return Project.find_by_sql(['select projects.* from projects inner join vehicles on vehicles.id = projects.vehicle_id and vehicles.user_id = ? limit ?', user_id, limit])
  end
end
