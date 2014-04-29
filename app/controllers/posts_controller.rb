class PostsController < ApplicationController
  before_action :require_current_user!

  def new
    @post = Post.new
    3.times { @post.links.new }
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.links.new(link_params)

    if @post.save
      redirect_to post_url @post
    else
      flash.now[:errors] = ["ya done fucked up, bowa"]
      (3 - @post.links.length).times { @post.links << Link.new }
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    3.times { @post.links.new }
    render :edit
  end

  def update
    #@post = Post.find(params[:id])
  end

  def destroy

  end

  def index

  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

end
