class SysConfig < ActiveRecord::Base
  belongs_to :system
  has_many :components, :dependent => :destroy
  
  def total
    components.collect{|c| c.cost}.inject{|sum,c| sum + c}
  end
end
