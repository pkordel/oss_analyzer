require File.dirname(__FILE__) + '/../test_helper'

class SysConfigsControllerTest < ActionController::TestCase

  def setup
    super
    @user = users(:quentin)
    @system = systems(:one)
    @sys_config = sys_configs(:one)
    login_as :quentin
  end

  def test_should_get_index
    get :index, { :user_id => @user, :system_id => @system }
    assert_response :success
    assert assigns(:sys_configs)
  end

  def test_should_get_new
    get :new, { :user_id => @user, :system_id => @system }
    assert_response :success
    assert_not_nil assigns(:sys_config)
    assert_equal "#{@system.name} Configuration", assigns(:sys_config).name
  end
  
  def test_should_create_sys_config
    old_count = SysConfig.count
    post :create, :sys_config => { }, :user_id => @user, :system_id => @system
    assert_equal old_count+1, SysConfig.count
    
    assert_redirected_to user_system_sys_config_path(@user, @system, assigns(:sys_config))
  end

  def test_should_show_sys_config
    get :show, {:user_id => @user, :system_id => @system, :id => @sys_config}
    assert_response :success
  end

  def test_should_get_edit
    get :edit, {:user_id => @user, :system_id => @system, :id => @sys_config}
    assert_response :success
  end
  
  def test_should_update_sys_config
    put :update, :user_id => @user, :system_id => @system, :id => @sys_config, :sys_config => { }
    assert_redirected_to user_system_sys_configs_path(@user, @system)
  end
  
  def test_should_destroy_sys_config
    old_count = SysConfig.count
    delete :destroy, :user_id => @user, :system_id => @system, :id => @sys_config
    assert_equal old_count-1, SysConfig.count
    
    assert_redirected_to user_system_sys_configs_path
  end
end
