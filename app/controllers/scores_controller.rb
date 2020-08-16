class ScoresController < ApplicationController
  def index
    scores = Score.select(:name, :score).order(score: :desc).limit(3)
    scores = scores.map { |score| "#{score.name}: #{score.score}" }.join("\n")

    render json: scores
  end

  def save_score
    Rails.logger.info request.user_agent
    if request.user_agent && request.user_agent.start_with?("DragonRuby")
      Score.create(name: params[:name], score: params[:score])
      head :ok
    else
      head :unauthorized
    end
  end
end
