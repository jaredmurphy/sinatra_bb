# frozen_string_literal: true

class SessionsController < ApplicationController
  get "/sign_in" do
    erb :"sessions/new"
  end

  post "/sign_in" do
    user = User.find_by(email: params[:user][:email])

    if user&.authenticate(params[:user][:password])
      session.clear
      session[:user_id] = user.id
      redirect to "/posts"
    else
      @error_message = "Your credentials are invalid"
      erb :"sessions/new"
    end
  end

  post "/sign_out" do
    session.clear

    redirect to "/"
  end
end
