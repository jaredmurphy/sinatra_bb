# frozen_string_literal: true

# set the database based on the current environment
database_name = "brassbull_#{BrassBull.environment}"
db = URI.parse(ENV["DATABASE_URL"] || "postgres://localhost/#{database_name}")

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  host: db.host,
  port: db.port,
  username: db.user,
  password: db.password,
  database: database_name.to_s,
  encoding: "utf8"
)
