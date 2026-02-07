class PapersController < ApplicationController
  before_action :set_wall

  def new
    @paper = @wall.papers.new
  end

  def create
    @paper = current_user.wall.papers.new(paper_params)

  # Center positioning (safe for note & heart)
    @paper.x = 200
    @paper.y = 150

  # Extra safety for heart (bigger size)
    if @paper.paper_type == "heart"
      @paper.x = 150
      @paper.y = 120
    end

    if @paper.save
      redirect_to wall_path
    else
      render :new
    end
  end



  private

  def set_wall
    @wall = current_user.wall
  end

  def paper_params
    params.require(:paper).permit(:content, :paper_type)
  end
end
