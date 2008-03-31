class Project < ActiveRecord::Base
    belongs_to :truck
    has_many :project_steps, :dependent => :destroy
    validates_presence_of :title
    validates_presence_of :truck_id
end
