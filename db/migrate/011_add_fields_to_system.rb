class AddFieldsToSystem < ActiveRecord::Migration
  def self.up
    add_column :systems, :system_type, :string
    add_column :systems, :sla, :string
    add_column :systems, :internal, :string
    add_column :systems, :user_count, :integer
    add_column :systems, :eol, :datetime
  end

  def self.down
    remove_column :systems, :system_type
    remove_column :systems, :sla
    remove_column :systems, :internal
    remove_column :systems, :user_count
    remove_column :systems, :eol
  end
end
