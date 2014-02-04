require "rubygems"
require "sinatra/base"

class Jonesdeinidotcom < Sinatra::Base

  get '/' do
    'Hello, nginx and unicorn!'
  end

end
