set :application, "tsunami"
set :domain, 'berkelium.redpill.se'

set :path, "/var/sites"
# set :rails_env, "staging"

set :checkout, "export"
set :deploy_via,  :remote_cache


set :repository, "http://svn.redpill.se/#{application}/trunk"
set :deploy_to, "#{path}/#{application}" 
role :web, domain
role :app, domain
role :db,  domain, :primary => true
set :user, "deploy"
set :group, "deploy"

set :use_sudo, false

set :keep_releases, 3
set :checkout, "export"