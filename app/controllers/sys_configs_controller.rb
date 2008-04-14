class SysConfigsController < ApplicationController
  
  before_filter :login_required, :get_system
  
  # GET /sys_configs
  # GET /sys_configs.xml
  def index
    @sys_configs = @system.sys_configs.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @sys_configs.to_xml }
    end
  end

  # GET /sys_configs/1
  # GET /sys_configs/1.xml
  def show
    @sys_config = SysConfig.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @sys_config.to_xml }
    end
  end

  # GET /sys_configs/new
  def new
    @sys_config = @system.sys_configs.new(:name => "#{@system.name} Configuration");
  end

  # GET /sys_configs/1;edit
  def edit
    @components = @sys_config.components.find :all
    @products = Product.find(:all, :conditions => {:oss => false}).collect {|p| [ "#{p.manufacturer} #{p.name}", p.id ] }
  end

  # POST /sys_configs
  # POST /sys_configs.xml
  def create
    @sys_config = @system.sys_configs.build(params[:sys_config])
    respond_to do |format|
      if @sys_config.save
        flash[:notice] = 'SysConfig was successfully created.'
        format.html { redirect_to user_system_sys_config_url(@user, @system, @sys_config) }
        format.xml  { head :created, :location => user_system_sys_config_url(@user, @system, @sys_config) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sys_config.errors.to_xml }
      end
    end
  end

  # PUT /sys_configs/1
  # PUT /sys_configs/1.xml
  def update

    respond_to do |format|
      if @sys_config.update_attributes(params[:sys_config])
        flash[:notice] = 'SysConfig was successfully updated.'
        format.html { redirect_to user_system_sys_configs_path(@user, @system) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sys_config.errors.to_xml }
      end
    end
  end

  # DELETE /sys_configs/1
  # DELETE /sys_configs/1.xml
  def destroy
    @sys_config = SysConfig.find(params[:id])
    @sys_config.destroy

    respond_to do |format|
      format.html { redirect_to user_system_sys_configs_url }
      format.xml  { head :ok }
    end
  end
  
private

  def get_system
    @user = current_user
    @system = @user.systems.find(params[:system_id]) if params[:system_id]
    @sys_config = @system.sys_configs.find(params[:id]) if params[:id]
  end
  
end
