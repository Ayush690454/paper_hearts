class WallsController < ApplicationController
  def show
    @wall = current_user.wall
    @papers = @wall.papers
  end

  def create
    @wall = current_user.create_wall(wall_params)
    redirect_to @wall
  end

  private

  def wall_params
    params.require(:wall).permit(:title)
  end
end
