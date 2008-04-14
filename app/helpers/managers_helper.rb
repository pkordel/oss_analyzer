module ManagersHelper
  # Convenience method to calculate system savings based on
  # which mappings are configured. A Mapping consists of a 
  # proprietary product reference named source and an open source
  # reference named destination. The mapping.balance method shows 
  # the savings possible by going from proprietary to open source, 
  # minus migration costs.
  def potential_savings(system=nil)
    savings = 0
    return savings unless system && 
                          (current_config = system.sys_configs.first) &&
                          (mappings = Mapping.find :all)
    # A sys_config has multiple components, each with a product reference 
    # and a quantity. See if they can be mapped to an open source solution
    # for crazy savings!
    current_config.components.each do |c|
      m = mappings.find{ |m| m.source_id == c.product_id }
      savings += m.balance * c.quantity if m
    end
    savings
  end
  def show_lamp(system)
    @s = potential_savings system
    return "red.gif" if @s < 0
    case @s
    when 0..1000000; "red.gif" 
    when 1000000..5000000; "yellow.gif"
    else "green.gif"
    end
  end
end
