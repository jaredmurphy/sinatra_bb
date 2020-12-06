# frozen_string_literal: true

class PostsController < ApplicationController
  get "/posts" do
    @title = "Posts Index"
    @users_count = ::User.count
    @posts_count = ::Post.count
    erb :'posts/index'
  end

  get "/posts/new" do
    protected!
    erb :'posts/new'
  end

  get "/posts/:slug" do
    @post = Post.find_by(slug: params[:slug])
    erb :'posts/show'
  end

  post "/posts" do
    protected!

    post = Posts.create(post_params)

    if post.persisted?
      @success_message = "Post created"
      redirect "/posts/#{post.slug}"
    else
      @error_message = posts.errors
      erb :'posts/new'
    end
  end

  private

  def post_params
    params.slice(:title, :body, :user_id)
  end
end
