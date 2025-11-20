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
    @analysis.image = "jpg"
    
    if @analysis.save
      redirect_to @analysis, notice: 'Analysis was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  private

  def analyses_params
    params.require(:analysis).permit(:name, :participants, :analysis_type, :goals)
  end
end
