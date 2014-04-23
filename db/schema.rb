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
      attribute :email, String, rename: :comment_email
      attribute :message, String, rename: :comment_message

      key :id
    end

    base_relation :posts do
      repository :postgres

      attribute :id, Integer, rename: :post_id
      attribute :title, String, rename: :post_title
      attribute :body, String, rename: :post_body

      key :id
    end
  end

  mapping do
    relation :comments do
      model Comment

      map :id, from: :comment_id
      map :post_id
      map :email, from: :comment_email
      map :message, from: :comment_message
    end

    relation :posts do
      model Post

      map :id, from: :post_id
      map :title, from: :post_title
      map :body, from: :post_body
    end
  end
end
