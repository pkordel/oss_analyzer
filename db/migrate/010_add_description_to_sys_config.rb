class AddDescriptionToSysConfig < ActiveRecord::Migration
  def self.up
    add_column :sys_configs, :description, :text
  end

  def self.down
    remove_column :sys_configs, :description
  end
end
