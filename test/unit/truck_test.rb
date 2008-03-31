require File.dirname(__FILE__) + '/../test_helper'

class TruckTestNewSave < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    truck_title = "My 2003 Tacoma"
    t = Truck.new(:title=>truck_title,
                  :year=>"2003",
                  :mileage=>"56000",
                  :doors=>2,
                  :street_legal=>true,
                  :public=>true,
                  :for_sale=>false,
                  :model=>73,
                  :engine_id=>Engine.find(:first),
                  :drive_id=>Drive.find(:first),
                  :transmission_id=>Transmission.find(:first),
                  :condition_id=>Condition.find(:first),
                  :user_id=>1)
    t.save
    t.reload
    assert_equal t.title, truck_title
  end
end
