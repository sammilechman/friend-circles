class CirclesController < ApplicationController
  def new
    @circle = Circle.new
    render :new
  end

  def create
    @circle = Circle.new(circle_params)

    if @circle.save
      redirect_to circle_url @circle
    else
      flash.now[:errors] = @circle.errors.full_messages
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

  end

  private
  def circle_params
    params.require(:circle).permit(:name, :owner_id, user_ids: [])
  end
end
