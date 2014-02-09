require 'haml'
require 'sinatra/base'

class Jonesdeinidotcom < Sinatra::Base

  set :haml, format: :html5 # This isn't default?

  get '/' do
    haml :home
  end
end
