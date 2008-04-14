class Component < ActiveRecord::Base
  belongs_to :product
  belongs_to :sys_config
  before_save :init_quantity
  
  def cost
    product.cost * quantity
  end
  
  def init_quantity
    self.quantity = 1 if self.quantity.blank?
  end
  
end
