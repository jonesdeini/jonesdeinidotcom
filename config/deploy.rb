require 'bundler/capistrano'
require "rvm/capistrano"

set :rvm_ruby_string, "ruby-2.1.0-p0@jonesdeinidotcom"

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
