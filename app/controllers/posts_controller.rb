# frozen_string_literal: true

class PostsController < ApplicationController
  # index
  get "/archives" do
    @title = "Posts Index"
    @posts = Post.order(created_at: :desc)
    erb :'posts/index'
  end

  # new
  get "/posts/new" do
    protected!
    @post = Post.new
    erb :'posts/new'
  end

  # edit
  get "/posts/:slug/edit" do
    protected!

    @post = Post.find_by(slug: params[:slug])
    erb :'posts/edit'
  end

  # show
  get "/posts/:slug" do
    @post = Post.find_by(slug: params[:slug])
    erb :'posts/show'
  end

  # update
  post "/posts/:slug" do
    protected!

    @post = Post.find_by(slug: params[:slug])

    if @post.update(post_params)
      @success_message = "Post updated"
      redirect "/posts/#{@post.slug}"
    else
      @error_message = @post.errors
      erb :'posts/edit'
    end
  end

  # create
  post "/posts" do
    protected!

    post = Posts.create(post_params)

    if post.persisted?
      @success_message = "Post created"
      redirect "/posts/#{post.slug}"
    else
      @error_message = post.errors
      erb :'posts/new'
    end
  end

  private

  def post_params
    params.fetch(:post).slice(:title, :body, :user_id)
  end
end
