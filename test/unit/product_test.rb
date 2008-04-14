require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < ActiveSupport::TestCase

  def test_should_have_components
    assert_not_nil(products(:one).components)
    assert_equal(2, products(:one).components.size)
  end
  
  def test_should_calculate_cost
    assert_not_nil(products(:one).cost)
    assert_equal(2, products(:one).cost)
  end
  
  def test_should_validate_type
    p = Product.new
    assert !p.valid?
    assert p.errors.on(:type)
  end
  
end
