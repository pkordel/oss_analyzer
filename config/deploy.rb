require "mongrel_cluster/recipes"
set :stages, %w(staging production)
require 'capistrano/ext/multistage'

set :default_stage, "staging"

namespace :deploy do

  task :after_update_code do
    run "ln -nfs #{path}/#{application}/etc/database.yml #{release_path}/config/database.yml"
    run "ln -fs #{path}/#{application}/etc/mongrel_cluster.yml /etc/mongrel_cluster/#{application}.yml"
  end

  task :after_setup do
    run "mkdir -p -m 777 #{path}/#{application}/etc"
    run "chmod 777 #{path}/#{application}/shared/log"
  end

end

after  "deploy", "deploy:cleanup"
