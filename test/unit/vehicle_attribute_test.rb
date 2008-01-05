require File.dirname(__FILE__) + '/../test_helper'

class VehicleAttributeTest < ActiveSupport::TestCase
  
  fixtures :vehicle_attributes
  
  def test_vehicle_attributes_fixtures
    va = VehicleAttribute.find(:all)
    assert_equal 115, va.length
    make = Make.find(:all)
    assert_equal 15, make.length
    model = Model.find(:all)
    assert_equal 82, model.length
    engine = Engine.find(:all)
    assert_equal 3, engine.length
  end
end