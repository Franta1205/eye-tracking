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

    if params[:analysis][:image].present?
      begin
        api_response = SaliencyApiService.call(
          params[:analysis][:image],
          @analysis.participants
        )
        @analysis.image = api_response['saliency_map_url']
        if api_response['analysis']
          @analysis.ai_feedback = api_response['analysis']
        end
        if api_response['metrics']
          @analysis.shannon_entropy = api_response['metrics']['shannon_entropy']
          @analysis.visual_clarity = api_response['metrics']['visual_clarity']
          @analysis.clutter_index = api_response['metrics']['clutter_index']
          @analysis.cognitive_load = api_response['metrics']['cognitive_load']
        end
      rescue => e
        @analysis.errors.add(:image, "Failed to process image: #{e.message}")
        render :new, status: :unprocessable_entity
        return
      end
    else
      @analysis.errors.add(:image, "Image is required")
      render :new, status: :unprocessable_entity
      return
    end

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
