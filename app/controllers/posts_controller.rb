class PostsController < ApplicationController

  def new
    @post = Post.new
    3.times { @post.links << Link.new }
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

  end

  def update

  end

  def destroy

  end

  def index

  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

  def link_params
    params.permit( links: [:url, :post_id] )
          .require(:links)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end

end
