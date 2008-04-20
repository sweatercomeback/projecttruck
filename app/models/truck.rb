class Truck < ActiveRecord::Base
  belongs_to :user
  has_many :projects, :dependent => :destroy
  has_many :service_logs, :dependent => :destroy
  has_many :truck_photos, :dependent => :destroy
  has_many :photos, :through => :truck_photos, :dependent => :destroy
  belongs_to :engine
  belongs_to :drive
  belongs_to :transmission
  belongs_to :condition
  belongs_to :model, :include => :make
  belongs_to :ext_color, :class_name => 'Color'
  belongs_to :int_color, :class_name => 'Color'
  
  validates_presence_of :title
  validates_presence_of :model_id
  validates_numericality_of :mileage, :allow_nil => true
  validates_numericality_of :year, :allow_nil => true
  
  def self.find_by_user_id_or_public(user_id, id)
    Truck.find(:first, :conditions => "(user_id = #{user_id} and id = #{id}) or (id = #{id} and public = 1)")
  end
  
  def mileage=(miles)
    write_attribute(:mileage, miles.to_s.gsub(/[^0-9]/,""))
  end

end
