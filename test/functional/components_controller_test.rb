require File.dirname(__FILE__) + '/../test_helper'

class ComponentsControllerTest < ActionController::TestCase

  def setup
    super
    @user = users(:quentin)
    @system = systems(:one)
    @sys_config = sys_configs(:one)
    login_as :quentin
  end

  def test_should_get_index
    get :index, :user_id => @user, :system_id => @system, :sys_config_id => @sys_config
    assert_response :success
    assert assigns(:components)
  end

  def test_should_get_new
    get :new, :user_id => @user, :system_id => @system, :sys_config_id => @sys_config
    assert_response :success
  end
  
  def test_should_create_component
    old_count = Component.count
    post :create, :component => { }, 
                  :sys_config_id => @sys_config, 
                  :user_id => @user, 
                  :system_id => @system
    assert_equal old_count+1, Component.count

    assert_redirected_to edit_user_system_sys_config_path(@user, @system, @sys_config)
  end

  def test_should_show_component
    get :show, :id => components(:one), 
               :sys_config_id => @sys_config, 
               :user_id => @user, 
               :system_id => @system
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => components(:one), 
               :sys_config_id => @sys_config, 
               :user_id => @user, 
               :system_id => @system
    assert_response :success
  end
  
  def test_should_update_component
    put :update, :id => components(:one), 
                 :component => { }, 
                 :sys_config_id => @sys_config, 
                 :system_id => @system
    assert_redirected_to edit_user_system_sys_config_url(@user, @system, @sys_config)
  end
  
  def test_should_destroy_component
    old_count = Component.count
    delete :destroy, :id => components(:one), 
                     :component => { }, 
                     :sys_config_id => @sys_config, 
                     :system_id => @system
    assert_equal old_count-1, Component.count
    
    assert_redirected_to edit_user_system_sys_config_path(@user, @system, @sys_config)
  end
  
end
