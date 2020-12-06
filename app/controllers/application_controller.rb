# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  helpers do
    def protected!
      return if authorized?

      halt 401, "Not authorized\n"
    end

    def authorized?
      current_user.present?
    end
  end

  configure do
    set :views, "app/views"
    set :public_dir, "public"
    enable :sessions
    enable :logging
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
