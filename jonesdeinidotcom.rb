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
    comments = SCHEMA[:comments]
    posts = posts.
      join(comments).
      group(comments: comments.project([:comment_id, :email, :message])).
      project([:post_id, :title, :body, :comments]).to_a

    haml :posts, :locals => { :posts => posts }
  end

end
