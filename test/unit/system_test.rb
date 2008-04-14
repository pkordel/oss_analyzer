require File.dirname(__FILE__) + '/../test_helper'

class SystemTest < ActiveSupport::TestCase

  def test_should_belong_to_user
    assert_not_nil systems(:one).user
  end
  
  def test_should_have_sys_configs
    assert_not_nil systems(:one).sys_configs
    assert_equal 'MyString', systems(:one).sys_configs.first.name
  end
  
  def test_should_create_sys_config
    system = create_system
    assert_not_nil system.sys_configs
    assert_equal 'Test Configuration', system.sys_configs.first.name
  end

  def test_should_create_with_valid_attributes
    assert_difference 'System.count' do
      system = create_system
      assert !system.new_record?, "#{system.errors.full_messages.to_sentence}"
    end
  end
  
  def test_should_require_valid_attributes
    assert_no_difference 'System.count' do
      system = create_system(:name => nil)
      assert system.errors.on(:name)
    end
  end
  
  def create_system(options={})
    System.create({ :name => 'Test' }.merge(options))
  end
  
end
