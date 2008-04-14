require File.dirname(__FILE__) + '/../test_helper'

class MappingsControllerTest < ActionController::TestCase

  def setup
    super
    login_as(:quentin)
    @mapping = mappings(:one)
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:mappings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_mapping
    old_count = Mapping.count
    post :create, :mapping => { }
    assert_equal old_count+1, Mapping.count
    
    assert_redirected_to mappings_url
  end

  def test_should_show_mapping
    get :show, :id => @mapping
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => @mapping
    assert_response :success
  end
  
  def test_should_update_mapping
    put :update, :id => @mapping, :mapping => { }
    assert_redirected_to mappings_url
  end
  
  def test_should_destroy_mapping
    old_count = Mapping.count
    delete :destroy, :id => @mapping
    assert_equal old_count-1, Mapping.count
    
    assert_redirected_to mappings_path
  end
end
