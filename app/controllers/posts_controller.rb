# frozen_string_literal: true

class PostsController < ApplicationController
  get "/posts" do
    @title = "Posts Index"
    @users_count = ::User.count
    @posts_count = ::Post.count
    erb :'posts/index'
  end
end
