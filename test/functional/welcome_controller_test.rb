require File.dirname(__FILE__) + '/../test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def test_should_get_index
    get :index
    assert_response :success
  end
  
end
