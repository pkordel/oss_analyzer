class ManagersController < ApplicationController
  
  before_filter :login_required
  
  # GET /systems
  # GET /systems.xml
  def index
    @systems = System.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @systems.to_xml }
    end
  end

  def search
  end
  
  def show_pdf
    sys = System.find(params[:id]) if params[:id]
    begin
      send_pdf "Open_Source_Migration_DP1_#{sys.id}.pdf"
    rescue
      send_pdf "Open_Source_Migration_DP1.pdf"
    end
  end
  
  def send_pdf(filename)
    send_file("#{RAILS_ROOT}/public/#{filename}", 
      :disposition => 'inline', 
      :filename => URI.encode(filename))
  end
  
end
