class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.column :product_id, :integer
      t.column :sys_config_id, :integer
      t.column :quantity, :integer
      t.column :unit_price, :decimal, :precision => 8, :scale => 2
    end
  end

  def self.down
    drop_table :components
  end
end
