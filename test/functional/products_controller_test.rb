require File.dirname(__FILE__) + '/../test_helper'

class ProductsControllerTest < ActionController::TestCase

  def setup
    super
    @product = products(:one)
    login_as :quentin
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:products)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_product
    old_count = Product.count
    post :create, :product => { :name => 'Foo', 
                                :manufacturer => 'Bar', 
                                :type => Product::TYPES['Database'] }
    assert_equal old_count+1, Product.count
    
    assert_redirected_to products_url
  end

  def test_should_show_product
    get :show, :id => @product
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => @product
    assert_response :success
  end
  
  def test_should_update_product
    put :update, :id => @product, :product => { }
    assert_redirected_to products_url(:oss => (@product.oss ||= 'false'))
  end
  
  def test_should_destroy_product
    old_count = Product.count
    delete :destroy, :id => @product
    assert_equal old_count-1, Product.count
    
    assert_redirected_to products_url(:oss => (@product.oss ||= 'false'))
  end
end
