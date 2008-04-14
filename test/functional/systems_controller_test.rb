require File.dirname(__FILE__) + '/../test_helper'

class SystemsControllerTest < ActionController::TestCase

  def setup
    super
    @user = users(:quentin)
    @system = systems(:one)
    login_as :quentin
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:systems)
  end

  def test_should_get_new
    get :new, :user_id => @user
    assert_response :success
  end
  
  def test_should_create_system
    old_count = System.count
    post :create, :system => { :name => 'Test' }, :user_id => @user
    assert_equal old_count+1, System.count
    
    assert_redirected_to edit_user_system_sys_config_url(@user, assigns(:system), assigns(:system).sys_configs.first)
  end

  def test_should_show_system
    get :show, :id => @system, :user_id => @user
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => @system, :user_id => @user
    assert_response :success
  end
  
  def test_should_update_system
    put :update, :id => @system, :system => { }, :user_id => @user
    assert_redirected_to user_systems_url
  end
  
  def test_should_destroy_system
    old_count = System.count
    delete :destroy, :id => @system, :user_id => @user
    assert_equal old_count-1, System.count
    
    assert_redirected_to user_systems_path
  end
end
