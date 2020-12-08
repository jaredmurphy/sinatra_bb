# frozen_string_literal: true

require "securerandom"

class ApplicationController < Sinatra::Base
  configure do
    set :root, APP_ROOT
    set :views, File.join(root, "app/views", "")
    set :public_folder, File.join(root, "public", "")
    I18n.load_path = [File.join(root, "config/locales", "en.yml")]

    set :method_override, true
    set :session_secret, ENV.fetch("SESSION_SECRET") { SecureRandom.hex(64) }
    enable :sessions
    enable :logging
  end

  helpers do
    def protected!
      return if authorized?

      halt 401, "Not authorized\n"
    end

    def authorized?
      current_user.present?
    end
  end

  before do
    current_user
  end

  not_found do
    erb :not_found
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
