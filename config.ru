# frozen_string_literal: true

require "dotenv/load"
require "bundler"
require "sinatra/activerecord"

Bundler.require

$LOAD_PATH.unshift(File.expand_path("app", __dir__))

set :database_file, "config/database.yml"
require File.expand_path("config/environment", __dir__)

run Sinatra::Application
