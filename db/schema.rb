require 'rom'
require 'do_postgres'
require_relative '../config/seakrets'

Dir[File.join(File.dirname(__FILE__), '../models', '*.rb')].each {|file| require_relative file }

SCHEMA = ROM::Environment.setup(postgres: "postgres://#{PG_USER}:#{PG_PASS}@localhost/#{PG_DATABASE}") do
  schema do
    base_relation :comments do
      repository :postgres

      attribute :id, Integer, rename: :comment_id
      attribute :post_id, Integer
      attribute :email, String
      attribute :message, String

      key :id
    end

    base_relation :posts do
      repository :postgres

      attribute :id, Integer, rename: :post_id
      attribute :title, String
      attribute :body, String

      key :id
    end
  end

  mapping do
    relation :comments do
      model Comment

      map :id, from: :comment_id
      map :post_id
      map :email
      map :message
    end

    relation :posts do
      model Post

      map :id, from: :post_id
      map :title
      map :body
    end
  end
end
