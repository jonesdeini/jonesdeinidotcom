require 'do_postgres'
require_relative '../config/seakrets'

def seed
  connection = DataObjects::Connection.new("postgres://#{PG_USER}:#{PG_PASS}@localhost/#{PG_DATABASE}")

  connection.create_command("INSERT INTO posts VALUES(1, 'sweet title bro', 'sickest blog ever yo')").execute_non_query

  connection.create_command("INSERT INTO comments VALUES(1, 1, 'trolling@you.bro', 'worst blog post ever')").execute_non_query

  connection.close
end

seed
