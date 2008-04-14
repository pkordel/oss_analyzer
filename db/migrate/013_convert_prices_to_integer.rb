class ConvertPricesToInteger < ActiveRecord::Migration
  def self.up
    remove_column :components, :unit_price
    change_column :products, :license, :integer
    change_column :products, :support, :integer
  end

  def self.down
    add_column :components, :unit_price,  :decimal, :precision => 8, :scale => 2
    change_column :products, :license,    :decimal, :precision => 8, :scale => 2
    change_column :products, :support,    :decimal, :precision => 8, :scale => 2
  end
end
