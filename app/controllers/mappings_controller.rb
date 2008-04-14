class MappingsController < ApplicationController
  
  before_filter :login_required, :get_products
  
  # GET /mappings
  # GET /mappings.xml
  def index
    @mappings = Mapping.find(:all)
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @mappings.to_xml }
    end
  end

  # GET /mappings/1
  # GET /mappings/1.xml
  def show
    @mapping = Mapping.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @mapping.to_xml }
    end
  end

  # GET /mappings/new
  def new
    @mapping = Mapping.new
  end

  # GET /mappings/1;edit
  def edit
    @mapping = Mapping.find(params[:id])
  end

  # POST /mappings
  # POST /mappings.xml
  def create
    @mapping = Mapping.new(params[:mapping])
    respond_to do |format|
      if @mapping.save
        flash[:notice] = 'Mapping was successfully created.'
        format.html { redirect_to mappings_url }
        format.xml  { head :created, :location => mappings_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mapping.errors.to_xml }
      end
    end
  end

  # PUT /mappings/1
  # PUT /mappings/1.xml
  def update
    @mapping = Mapping.find(params[:id])

    respond_to do |format|
      if @mapping.update_attributes(params[:mapping])
        flash[:notice] = 'Mapping was successfully updated.'
        format.html { redirect_to mappings_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mapping.errors.to_xml }
      end
    end
  end

  # DELETE /mappings/1
  # DELETE /mappings/1.xml
  def destroy
    @mapping = Mapping.find(params[:id])
    @mapping.destroy

    respond_to do |format|
      format.html { redirect_to mappings_url }
      format.xml  { head :ok }
    end
  end
  
  def get_products
    @sources = Product.find(:all, 
                            :conditions => {:oss => false}, 
                            :order => "manufacturer").collect{|s|["#{s.manufacturer} #{s.name} -->", s.id]}
    @destinations = Product.find(:all, 
                                 :conditions => {:oss => true}, 
                                 :order => "manufacturer").collect{|s|["#{s.manufacturer} #{s.name}", s.id]}
  end
end
