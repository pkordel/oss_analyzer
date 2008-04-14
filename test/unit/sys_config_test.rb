require File.dirname(__FILE__) + '/../test_helper'

class SysConfigTest < ActiveSupport::TestCase

  def test_should_belong_to_system
    assert_not_nil sys_configs(:one).system
  end

  def test_should_have_components
    assert_not_nil sys_configs(:one).components
  end
  
  def test_should_calculate_total
    assert_not_nil(sys_configs(:one).total)
    assert_equal(4, sys_configs(:one).total)
  end
  
end
