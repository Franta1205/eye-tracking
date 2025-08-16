class AnalysesController < ApplicationController
  def index
    if current_user.analyses.any?
      redirect_to current_user.analyses.last
    end
  end

  def new
    @analysis = Analysis.build
  end

  def create
    @analysis = current_user.analyses.build(analyses_params)
    
    if @analysis.save
      redirect_to @analysis, notice: 'Analysis was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @analyses = Analysis.find(params[:id])
  end

  private

  def analyses_params
    params.require(:analysis).permit(:name, :participants, :analysis_type, :image, :goals)
  end
end
