class ProjectStep < ActiveRecord::Base
    belongs_to :project
    validates_presence_of :details
end
