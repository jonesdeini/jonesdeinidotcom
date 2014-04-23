require 'rom'

class Post
  include Equalizer.new :id, :title, :body, :comments
  attr_accessor :id, :title, :body, :comments
end
