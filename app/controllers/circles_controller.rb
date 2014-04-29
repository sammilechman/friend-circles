class CirclesController < ApplicationController
  before_action :require_current_user!

  def new
    @circle = Circle.new
    render :new
  end

  def create
    # @circle = current_user.circles.new(circle_params)
    @circle = Circle.new(circle_params)

    if @circle.save
      redirect_to circle_url @circle
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def edit
    @circle = Circle.find(params[:id])
    render :edit
  end

  def update
    @circle = Circle.find(params[:id])
    if @circle.update_attributes(circle_params)
      redirect_to circle_url(@circle)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :edit
    end

  end

  def destroy

  end

  def index
    @circles = current_user.circles
  end

  def show
    @circle = current_user.circles.find(params[:id])
    render :show
  end

  private
  def circle_params
    params.require(:circle).permit(:name, :owner_id, user_ids: [])
  end
end
