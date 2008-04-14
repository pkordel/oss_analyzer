# create_table "systems", :force => true do |t|
#   t.string   "name"
#   t.text     "description"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "user_id"
#   t.integer  "status",          :default => 0
#   t.string   "system_type"
#   t.string   "sla"
#   t.string   "internal"
#   t.integer  "user_count"
#   t.datetime "eol"
#   t.string   "sys_admin_name"
#   t.string   "sys_admin_phone"
#   t.string   "sys_admin_email"
# end

class System < ActiveRecord::Base
  belongs_to :user
  has_many :sys_configs, :dependent => :destroy
  after_create :create_sys_config
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
  def create_sys_config
    sys_configs.create :name => "#{name} Configuration"
  end
end
