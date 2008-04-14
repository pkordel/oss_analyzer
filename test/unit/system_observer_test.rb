require File.dirname(__FILE__) + '/../test_helper'

class SystemObserverTest < ActiveSupport::TestCase
  
  def test_should_update_status_on_create
    system = System.create(:name => 'Test')
    assert_equal(25, system.status)
  end
  
  def test_should_update_status_when_components_added
    system = systems(:one)
    assert_equal(25, system.status)
    system.sys_configs.first.components << components(:one)
    system.reload
    assert_equal(50, system.status)
  end
  
end
