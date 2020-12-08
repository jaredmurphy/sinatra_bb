# frozen_string_literal: true

require "dotenv/load"
require "bundler"
Bundler.require
$LOAD_PATH.unshift(File.expand_path("app", __dir__))

require File.expand_path("config/environment", __dir__)

run BrassBull
