# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Return a link for use in layout navigation.
  def nav_link(text, controller, action='index')
    link_to_unless_current text, :id => nil, 
                                 :controller => controller, 
                                 :action => action
  end
  
  def truncate_string(myString = nil, length = 50) 	
    return myString if myString.length <= length
    myString.slice(0...length) << "..." unless myString.nil?
  end
  
  def display_date(date=nil)
    date.strftime("%Y-%m-%d") unless date.nil?
  end
  
  def swedish_currency(amount)
    number_to_currency(amount, :delimiter => " ", 
                               :separator => ",", 
                               :unit => "", 
                               :precision => 0)
  end

end
