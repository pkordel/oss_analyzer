class SystemsController < ApplicationController
  
  before_filter :login_required, :get_user
  
  # GET /systems
  # GET /systems.xml
  def index
    @systems = current_user.systems.find(:all)
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @systems.to_xml }
    end
  end

  # GET /systems/1
  # GET /systems/1.xml
  def show
    @sys_config = @system.sys_configs.first
    @components = @sys_config.components
    @total = @sys_config.total
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @system.to_xml }
    end
  end

  # GET /systems/new
  def new
    @system = System.new
  end

  # GET /systems/1;edit
  def edit
  end

  # POST /systems
  # POST /systems.xml
  def create
    @system = current_user.systems.build(params[:system])
    respond_to do |format|
      if @system.save
        # Set status
        @system.update_attributes(:status => 25)
        @sys_config = @system.sys_configs.first
        flash[:notice] = 'System was successfully created.'
        format.html { redirect_to edit_user_system_sys_config_url(@user, @system, @sys_config) }
        format.xml  { head :created, :location => user_system_url(@user, @system) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system.errors.to_xml }
      end
    end
  end

  # PUT /systems/1
  # PUT /systems/1.xml
  def update

    respond_to do |format|
      if @system.update_attributes(params[:system])
        flash[:notice] = 'System was successfully updated.'
        format.html { redirect_to user_systems_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system.errors.to_xml }
      end
    end
  end

  # DELETE /systems/1
  # DELETE /systems/1.xml
  def destroy
    @system.destroy

    respond_to do |format|
      format.html { redirect_to user_systems_url }
      format.xml  { head :ok }
    end
  end
  
private

  def get_user
    @user = current_user
    @system = @user.systems.find(params[:id]) if params[:id]
    #@sys_config = @system.sys_configs.first
  end
  
end
