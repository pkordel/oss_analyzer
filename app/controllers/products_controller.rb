class ProductsController < ApplicationController
  
  before_filter :login_required
  
  # GET /products
  # GET /products.xml
  def index
    
    sort = case params['sort']
           when "manufacturer"  then "manufacturer"
           when "product"   then "product"
           when "type" then "type"
           when "manufacturer_reverse"  then "manufacturer DESC"
           when "product_reverse"   then "product DESC"
           when "type_reverse" then "type DESC"
           else "manufacturer, type"
           end

    unless params[:query].nil?
      conditions = ["manufacturer LIKE ?", "%#{params[:query]}%"] 
    end
    
    unless params[:oss].nil?
      @type = params[:oss]
      conditions = ["oss=#{@type}"]
    end
    
    @total = Product.count(:conditions => conditions)
    
    case @type
    when 'true'
      @products = Product.find(:all, :conditions => conditions, 
                                     :order => sort)
      @title = 'Listing Open Source Products'
    when 'false'
      @products = Product.find(:all, :conditions => conditions, 
                                     :order => sort)
      @title = 'Listing Proprietary Products'
    else
      @products = Product.find(:all, :order => sort)
      @title = 'Listing All Products'
    end

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @products.to_xml }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @product.to_xml }
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1;edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    # See below... slightly ugly
    product_by_type
    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to products_url }
        format.xml  { head :created, :location => products_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors.to_xml }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to products_url(:oss => (@product.oss ||= 'false')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors.to_xml }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    oss = @product.oss
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url(:oss => (oss ||= 'false')) }
      format.xml  { head :ok }
    end
  end
  
protected

  # Dirty hack!!
  def product_by_type
    
    unless params[:product][:type]
      @product = Product.new(params[:product])
      return
    end
    
    case params[:product][:type].downcase
    when 'hw'
      @product = Hardware.new(params[:product])
    when 'os'
      @product = Os.new(params[:product])
    when 'db'
      @product = Database.new(params[:product])
    when 'mw'
      @product = Middleware.new(params[:product])
    when 'ws'
      @product = Webserver.new(params[:product])
    else
      @product = Product.new(params[:product])
    end
  end
  
end
