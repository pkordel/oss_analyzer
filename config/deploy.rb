require "mongrel_cluster/recipes"
set :stages, %w(staging production)
require 'capistrano/ext/multistage'

set :default_stage, "staging"

namespace :maintain do

  desc "tail production log files" 
  task :tail_logs, :roles => :app do
    run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:host]}: #{data}" 
      break if stream == :err    
    end
  end

  desc "check production log files in textmate(tm)" 
  task :mate_logs, :roles => :app do

    require 'tempfile'
    tmp = Tempfile.open('w')
    logs = Hash.new { |h,k| h[k] = '' }

    run "tail -n500 #{shared_path}/log/production.log" do |channel, stream, data|
      logs[channel[:host]] << data
      break if stream == :err
    end

    logs.each do |host, log|
      tmp.write("--- #{host} ---\n\n")
      tmp.write(log + "\n")
    end

    system "mate -w #{tmp.path}" 
    tmp.close
  end

  desc "remotely console" 
  task :console, :roles => :app do
    input = ''
    run "cd #{current_path} && ./script/console production" do |channel, stream, data|
      next if data.chomp == input.chomp || data.chomp == ''
      print data
      channel.send_data(input = $stdin.gets) if data =~ /^(>|\?)>/
    end
  end

  desc "Analyze Rails Log instantaneously" 
  task :pl_analyze, :roles => :app do
    run "pl_analyze #{shared_path}/log/production.log" do |ch, st, data|
      print data
    end
  end

  desc "Run rails_stat" 
  task :rails_stat, :roles => :app do
    stream "rails_stat #{shared_path}/log/production.log" 
  end

  desc "Get log" 
  task :get_log, :roles => :app do
    system "scp #{domain}:#{deploy_to}/current/log/production.log ./log/#{domain}.production.log" 
  end
  
  desc "Dump globalize"
  task :get_globalize_dump do
    run "cd #{release_path} && rake db:dump_globalize"
    system "scp #{domain}:#{path}/#{application}/current/db/globalize.sql ./db/globalize.sql"
  end

  desc "Dump and get database"
  task :get_database_dump do
    run "cd #{path}/#{application}/current && rake db:sql_dump "
    system "scp #{domain}:#{path}/#{application}/current/db/coworker_production.sql ./db/coworker_production_copy.sql"
  end
  

end

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


