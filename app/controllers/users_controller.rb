class UsersController < ApplicationController
  before_action :require_current_user!, except: [:new, :create]
  def new
    @post = Post.new
    @user = User.new
    3.times { @post.links.new }
    render :new
  end

  def create
    @user = User.new(user_params)
    @post = @user.posts.new(post_params)
    @post.links.new(link_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      @post = Post.new
      3.times { @post.links.new }
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def feed
    @user = current_user
    render :feed
  end


end
