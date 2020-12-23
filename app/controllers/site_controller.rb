# frozen_string_literal: true

class SiteController < ApplicationController
  get "/" do
    @name = @current_user&.name
    @post = Post.order(:created_at).last
    erb :welcome
  end

  get "/user/:username" do
    session[:username] = params[:username]
    erb :welcome
  end
end
