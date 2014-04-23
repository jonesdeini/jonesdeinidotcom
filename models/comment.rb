require 'rom'

class Comment
  include Equalizer.new :id, :email, :message, :post
  attr_accessor :id, :email, :message, :post
end
