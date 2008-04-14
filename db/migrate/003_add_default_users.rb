class AddDefaultUsers < ActiveRecord::Migration
  def self.up
    User.create :login => 'admin', 
                :password => 'secret', 
                :password_confirmation => 'secret', 
                :email => 'admin@example.com',
                :role => 'admin'
    User.create :login => 'owner', 
                :password => 'secret', 
                :password_confirmation => 'secret', 
                :email => 'owner@example.com',
                :role => 'owner'
    User.create :login => 'sourcing', 
                :password => 'secret', 
                :password_confirmation => 'secret', 
                :email => 'sourcing@example.com',
                :role => 'sourcing'
    User.create :login => 'manager', 
                :password => 'secret', 
                :password_confirmation => 'secret', 
                :email => 'manager@example.com',
                :role => 'manager'
  end

  def self.down
    User.delete_all
  end
end
