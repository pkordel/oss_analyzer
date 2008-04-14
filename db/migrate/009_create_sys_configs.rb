class CreateSysConfigs < ActiveRecord::Migration
  def self.up
    create_table :sys_configs do |t|
      t.column :system_id, :integer
      t.column :name, :string
    end
  end

  def self.down
    drop_table :sys_configs
  end
end
