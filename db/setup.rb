require 'do_postgres'
require_relative '../config/seakrets'

def setup_db
  connection = DataObjects::Connection.new("postgres://#{PG_USER}:#{PG_PASS}@localhost/#{PG_DATABASE}")

  connection.create_command('DROP TABLE IF EXISTS "posts"').execute_non_query
  connection.create_command('DROP TABLE IF EXISTS "comments"').execute_non_query

  connection.create_command(<<-SQL.gsub(/\s+/, ' ').strip).execute_non_query
    CREATE TABLE comments (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      post_id INTEGER NOT NULL,
      email VARCHAR(255),
      message TEXT
    )
  SQL

  connection.create_command(<<-SQL.gsub(/\s+/, ' ').strip).execute_non_query
    CREATE TABLE posts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title VARCHAR(255),
      body TEXT
    )
  SQL

  connection.close
end

setup_db
