class ComponentsController < ApplicationController

  before_filter :login_required, :get_sys_conf

  # GET /components
  # GET /components.xml
  def index
    @components = @sys_config.components.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @components.to_xml }
    end
  end

  # GET /components/1
  # GET /components/1.xml
  def show
    @component = Component.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @component.to_xml }
    end
  end

  # GET /components/new
  def new
    @component = Component.new
  end

  # GET /components/1;edit
  def edit
    @component = Component.find(params[:id])
  end

  # POST /components
  # POST /components.xml
  def create
    # See below... slightly ugly
    #component_by_type
    @component = @sys_config.components.build(params[:component])
    respond_to do |format|
      if @component.save
        flash[:notice] = 'Component was successfully created.'
        format.html { redirect_to edit_user_system_sys_config_path(@user, @system, @sys_config) }
        format.xml  { head :created, :location => component_url(@component) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component.errors.to_xml }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.xml
  def update
    @component = Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:component])
        flash[:notice] = 'Component was successfully updated.'
        format.html { redirect_to edit_user_system_sys_config_url(@user, @system, @sys_config) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component.errors.to_xml }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.xml
  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to edit_user_system_sys_config_path(@user, @system, @sys_config) }
      format.xml  { head :ok }
    end
  end
  
private

  def get_sys_conf
    @user = current_user
    @system = @user.systems.find(params[:system_id]) if params[:system_id]
    @sys_config = @system.sys_configs.find(params[:sys_config_id]) if params[:sys_config_id]
    @component = @sys_config.components.find(params[:id]) if params[:id]
  end
  
end
