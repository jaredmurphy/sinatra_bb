# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  # helpers ApplicationHelper

  configure do
    set :views, "app/views"
    set :public_dir, "public"
    enable :sessions
    enable :logging
  end

  before do
    set_current_user
  end

  not_found do
    erb :not_found
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
