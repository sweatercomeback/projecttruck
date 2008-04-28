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
  acts_as_mappable
  
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
                  price_min, price_max, only_price_listed, transmission_id, engine_id, drive_id,
                  fuel_id, int_color_ids, ext_color_ids, doors, condition_id)
      
      finder = RecordFinder.new
      
      zip_origin = nil
      zip_within = nil
      
      finder.add "public = 1" #only search trucks with public flag
      finder.add("truck_attributes.parent_id = ?", make_id) unless make_id.blank?
      finder.add("model_id = ?", model_id) unless model_id.blank?
      finder.add("year >= ?", start_year) unless start_year.blank?
      finder.add("year <= ?", end_year) unless end_year.blank?
      finder.add("transmission_id = ?", transmission_id) unless transmission_id.blank?
      finder.add("engine_id = ?", engine_id) unless engine_id.blank?
      finder.add("drive_id = ?", drive_id) unless drive_id.blank?
      finder.add("fuel_id = ?", fuel_id) unless fuel_id.blank?
      finder.add("doors = ?", doors) unless doors.blank?
      finder.add("condition_id = ?", condition_id) unless condition_id.blank?
      
      unless int_color_ids.nil?
        int_color_ids.each{|key, value| finder.add("int_color_id = ?", value) unless value.blank?}
      end
      
      unless ext_color_ids.nil?
        ext_color_ids.each{|key, value| finder.add("ext_color_id = ?", value) unless value.blank?}
      end      
      
      unless for_sale.blank?
        finder.add "for_sale = 1"
        finder.add("price >= ?", price_min.gsub(/[^0-9]/,"")) unless price_min.blank?
        finder.add("price <= ?", price_max.gsub(/[^0-9]/,"")) unless price_max.blank?
        finder.add("price is not null") unless only_price_listed.blank?
        
        unless zip.blank? && !distance.blank?
          #begin
            trucks = Truck.find(:all, :include => 'model', :conditions => finder.to_conditions, :origin => zip, :within => distance)
          #rescue GeoKit::Geocoders::GeocodeError
            #this error probably means that the provider(ie google) couldn't find the zip
            #right now I'm just doing the search without the zip criteria but we should probably
            #do some friendly validation to let the user know what is going on
            #maybe some ajax when the zip field loses focus to validate it--or the onclick of the submit?
            #trucks = nil
          #end
            
        end
      end
      
      if trucks.nil?
        trucks = Truck.find(:all, :include => 'model', :conditions => finder.to_conditions)
      end
      
      return trucks
  end

end
