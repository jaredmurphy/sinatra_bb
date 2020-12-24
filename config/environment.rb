# frozen_string_literal: true

require "bundler"
Bundler.require

# get the path of the root of the app
APP_ROOT = File.expand_path("../", __dir__)

# require the controller(s)
controllers = File.join(APP_ROOT, "app", "controllers")
require File.join(controllers, "application_controller")
require File.join(controllers, "site_controller")
require File.join(controllers, "sessions_controller")
require File.join(controllers, "posts_controller")

# require the model(s)
Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each { |file| require file }

# require the helper(s)
Dir.glob(File.join(APP_ROOT, "app", "helpers", "*.rb")).each { |file| require file }

# require the services(s)
Dir.glob(File.join(APP_ROOT, "app", "services", "*.rb")).each { |file| require file }

# require basic app
require "./brassbull"
