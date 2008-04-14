class SystemObserver < ActiveRecord::Observer
  observe :system, :sys_config, :component
  
  def after_create(record)
    record.status = 25 if record.is_a?(System)
  end

  def after_save(record)
    if record.is_a?(Component)
      update_system_status(record)
    end
  end

  def after_update(record)

  end
  
  def update_system_status(component)
    return unless component.is_a?(Component)
    begin
      system = component.sys_config.system
      system.update_attribute('status', 50)
    rescue Exception => e
      RAILS_DEFAULT_LOGGER.debug "Error in SystemObserver: #{e.message}"
    end
  end
  
end
