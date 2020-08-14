class ScoresController < ApplicationController
  def index
    scores = Score.select(:name, :score).order(score: :desc).limit(3)
    scores = scores.map { |score| "#{score.name}: #{score.score}" }.join("\n")

    render json: scores
  end

  def save_score
    Score.create(name: params[:name], score: params[:score])
  end
end
