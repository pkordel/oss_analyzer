class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :type, :string
      t.column :name, :string
      t.column :manufacturer, :string
      t.column :license, :decimal, :precision => 8, :scale => 2
      t.column :support, :decimal, :precision => 8, :scale => 2
    end
  end

  def self.down
    drop_table :products
  end
end
