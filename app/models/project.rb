class Project < ActiveRecord::Base
    belongs_to :truck
    has_many :project_steps, :dependent => :destroy
    validates_presence_of :title
    validates_presence_of :truck_id
    
    def self.find_by_user_id(user_id)
      Project.find(:all, :include => "truck", :conditions => "trucks.user_id = #{user_id}")
    end

    def self.find_by_user_id_and_id(user_id, id)
      Project.find(:first, :include => "truck", :conditions => "trucks.user_id = #{user_id} and projects.id = #{id}")
    end
    
    def self.find_by_truck_id_and_public(user_id, truck_id)
      Project.find(:first, :include => "truck", :conditions => "(trucks.user_id = #{user_id} and trucks.id = #{truck_id}) or (trucks.public = 1 and trucks.id = #{truck_id})")      
    end
end
