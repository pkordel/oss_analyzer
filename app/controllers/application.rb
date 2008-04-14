# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include AuthenticatedSystem

  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_tsunami_session_id'
  
  def download_pdf(filename)
    send_file("#{RAILS_ROOT}/public/"+filename, 
      :disposition => 'inline', 
      :type => "application/pdf",
      :filename => URI.encode(filename)) 
  end
  
end
