# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'jonesdeinidotcom'
set :repo_url, "git@github.com:jonesdeini/jonesdeinidotcom.git"

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/jonesdeinidotcom'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/seakrets.rb')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('tmp/pids', 'log')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# set :unicorn_config, "#{current_path}/config/unicorn.rb"
# set :unicorn_pid, "#{current_path}/tmp/pids"
set :unicorn_rack_env, 'production'
set :unicorn_config_path, 'config/unicorn.rb'

namespace :deploy do
#   task :start do
#     run "cd #{current_path} && bundle exec unicorn -c #{unicorn_config} -E production -D"
#   end
#   task :stop do
#     run "kill $(< #{unicorn_pid})"
#   end
#   task :graceful_stop do
#     run "kill -s QUIT `cat #{unicorn_pid}`"
#   end
#   task :reload do
#     run "kill -s USR2 $(< #{unicorn_pid})"
#   end
#   task :restart do
#     # stop
#     start
#   end

  task :restart do
    invoke 'unicorn:restart'
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after 'deploy:publishing', 'deploy:restart'
end
