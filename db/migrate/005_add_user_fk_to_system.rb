class AddUserFkToSystem < ActiveRecord::Migration
  def self.up
    add_column :systems, :user_id, :integer
  end

  def self.down
    remove_column :systems, :user_id
  end
end
