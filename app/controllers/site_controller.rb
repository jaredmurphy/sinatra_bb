# frozen_string_literal: true

class SiteController < ApplicationController
  get "/" do
    @name = session[:username]
    erb :welcome
  end

  get "/user/:username" do
    session[:username] = params[:username]
    erb :welcome
  end
end
