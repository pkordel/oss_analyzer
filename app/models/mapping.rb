class Mapping < ActiveRecord::Base
  belongs_to :source,       :class_name => "Product", :foreign_key => "source_id"
  belongs_to :destination,  :class_name => "Product", :foreign_key => "destination_id"
  before_save :init_migration_cost
  
  def balance 
    source.cost - (destination.cost + migration_cost)
  end
  
  def name
    "#{source.name}-to-#{destination.name}"
  end
  
  def init_migration_cost
    self.migration_cost = 0 if self.migration_cost.blank?
  end
  
end
