class AnalysesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  private

  def analyses_params
    params.require(:analysis).permit(:name, :participants, :analysis_type, :image, :goals)
  end
end
