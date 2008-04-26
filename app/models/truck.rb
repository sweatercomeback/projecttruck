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
  belongs_to :fuel
  
  validates_presence_of :title
  validates_presence_of :model_id
  validates_numericality_of :mileage, :allow_nil => true
  validates_numericality_of :year, :allow_nil => true
  
  def self.find_by_user_id_or_public(user_id, id)
    user_id = -1 if user_id.nil?
    Truck.find(:first, :conditions => "(user_id = #{user_id} and id = #{id}) or (id = #{id} and public = 1)")
  end
  
  def mileage=(miles)
    write_attribute(:mileage, miles.to_s.gsub(/[^0-9]/,""))
  end
  
  def self.search(make_id, model_id, start_year, end_year, for_sale, zip, distance,
                  price_min, price_max, transmission_id, engine_id, drive_id,
                  fuel_id)
      finder = RecordFinder.new
      finder.add "public = 1" #only search trucks with public flag
      if !make_id.blank?
        finder.add "truck_attributes.parent_id = ?", make_id
      end
      if !model_id.blank?
        finder.add "model_id = ?", model_id
      end
      if !start_year.blank?
        finder.add "year >= ?", start_year
      end
      if !end_year.blank?
        finder.add "year <= ?", end_year
      end
      if !for_sale.blank?
        finder.add "for_sale = 1"
        if !zip.blank?
          #add zip field to model
          #add geocode plugin
          #finder.add "zip = ?", zip
        end
        if !distance.blank?
          #add geocode plugin
          #finder.add ""
        end
        if !price_min.blank?
          finder.add "price >= ?", price_min.gsub(/[^0-9]/,"")
        end
        if !price_max.blank?
          finder.add "price <= ?", price_max.gsub(/[^0-9]/,"")
        end        
      end

      if !transmission_id.blank?
        finder.add "transmission_id = ?", transmission_id
      end
      if !engine_id.blank?
        finder.add "engine_id = ?", engine_id
      end
      if !drive_id.blank?
        finder.add "drive_id = ?", drive_id
      end
      if !fuel_id.blank?
        finder.add "fuel_id = ?", fuel_id
      end          
      
      return Truck.find(:all, :include => 'model', :conditions => finder.to_conditions)
  end

end
