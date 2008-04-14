class AddStatusToSystem < ActiveRecord::Migration
  def self.up
    add_column :systems, :status, :integer, :default => 0
  end

  def self.down
    remove_column :systems, :status
  end
end
