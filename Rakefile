# frozen_string_literal: true

require "dotenv/tasks"
require "sinatra/activerecord"
require "sinatra/activerecord/rake"

require "./config/environment"

# task mytask: :dotenv do
#   things that require .env
# end

task :console do
  Pry.start
end

task :server do
  sh("rackup config.ru")
end

task :spec do
  sh("bundle exec rspec spec/")
end
