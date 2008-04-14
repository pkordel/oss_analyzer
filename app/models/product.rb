class Product < ActiveRecord::Base
  
  has_many :components
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :manufacturer, :on => :create, :message => "can't be blank"
  
  TYPES = { 
    "Hardware" => "hw", 
    "OS" => "os",
    "Database" => "db",
    "Middleware" => "mw",
    "Web Server" => "ws"
  }
  
  # Validate single inheritance type is set
  def validate
    if self.class.name == 'Product'
      errors.add(:type, "can't be blank")
    end
  end
  
  def cost
    license + support
  end
  
end
