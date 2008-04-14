class CreateMappings < ActiveRecord::Migration
  def self.up
    create_table :mappings do |t|
      t.column :source_id, :integer
      t.column :destination_id, :integer
      t.column :migration_cost, :integer, :default => 0
      t.column :name, :string
    end
  end

  def self.down
    drop_table :mappings
  end
end
