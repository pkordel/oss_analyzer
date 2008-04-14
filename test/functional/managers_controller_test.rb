require File.dirname(__FILE__) + '/../test_helper'

class ManagersControllerTest < ActionController::TestCase
  
  def setup
    super
    login_as :quentin
  end
  
  def test_should_get_index
    get :index
    assert_response :success
  end
  
end
