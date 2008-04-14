require File.dirname(__FILE__) + '/../test_helper'

class ComponentTest < ActiveSupport::TestCase

  def test_should_belong_to_product
    assert_not_nil(components(:one).product)
  end
  
  def test_should_belong_to_sys_config
    assert_not_nil(components(:one).sys_config)
  end
  
  def test_should_calculate_cost
    assert_not_nil(components(:one).cost)
    assert_equal(2, components(:one).cost)
  end
  
  def test_should_initialize_quantity
    component = Component.create
    assert_equal(1, component.quantity)
  end
  
end
