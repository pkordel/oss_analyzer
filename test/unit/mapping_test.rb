require File.dirname(__FILE__) + '/../test_helper'

class MappingTest < ActiveSupport::TestCase

  def test_should_belong_to_product
    source = mappings(:one).source
    destination = mappings(:one).destination
    assert_not_nil(source)
    assert_not_nil(destination)
  end
  
  def test_should_have_valid_name
    assert_equal('Oracle-to-MySQL', mappings(:one).name)
  end
  
  def test_should_calculate_balance
    assert_equal(-1, mappings(:one).balance)
  end
  
  def test_should_initialize_migration_cost
    assert_equal(0, Mapping.new().migration_cost)
  end
  
end
