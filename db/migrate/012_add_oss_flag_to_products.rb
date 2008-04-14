class AddOssFlagToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :oss, :boolean, :default => false
    
    # Update existing records, but only if oss attribute is not set
    Product.find(:all).each {|p| p.update_attributes(:oss=>false) unless p.oss}
  end

  def self.down
    remove_column :products, :oss
  end
end
