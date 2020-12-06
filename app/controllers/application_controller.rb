# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  not_found do
    erb :not_found
  end
end
