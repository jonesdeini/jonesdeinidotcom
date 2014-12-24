require 'bundler/capistrano'
require "rvm/capistrano"

set :rvm_ruby_string, :local

set :application, "jonesdeinidotcom"
set :deploy_to, "/home/jonesdeinidotcom"

set :scm, :git
set :repository,  "git@github.com:jonesdeini/jonesdeinidotcom.git"
set :branch, "master"

set :use_sudo, false
set :user, "jonesdeinidotcom"

set :host, "184.73.157.166"
role :web, host
role :app, host

set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids"

set :linked_files, %w{config/seakrets.rb}

namespace :deploy do
  task :start do
    run "cd #{current_path} && bundle exec unicorn -c #{unicorn_config} -E production -D"
  end
  task :stop do
    run "kill $(< #{unicorn_pid})"
  end
  task :graceful_stop do
    run "kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :reload do
    run "kill -s USR2 $(< #{unicorn_pid})"
  end
  task :restart do
    # stop
    start
  end
end

after 'deploy:finalize_update', 'deploy:stop'
