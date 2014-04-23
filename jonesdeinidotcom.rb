require 'haml'
require 'sinatra/base'
require_relative 'db/schema'

class Jonesdeinidotcom < Sinatra::Base

  set :haml, format: :html5 # This isn't default?

  get '/' do
    haml :home
  end

  get '/blog' do
    posts = SCHEMA[:posts]
    haml :posts, :locals => { :posts => posts }
  end

end
