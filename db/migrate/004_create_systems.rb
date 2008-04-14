class CreateSystems < ActiveRecord::Migration
  def self.up
    create_table :systems do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :systems
  end
end
