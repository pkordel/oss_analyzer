class AddEolSysAdminToSystem < ActiveRecord::Migration
  def self.up
    add_column :systems, :sys_admin_name, :string
    add_column :systems, :sys_admin_phone, :string
    add_column :systems, :sys_admin_email, :string
  end

  def self.down
    remove_column :systems, :sys_admin_name
    remove_column :systems, :sys_admin_phone
    remove_column :systems, :sys_admin_email
  end
end
